/**
 * @name CallTimeCounter
 * @author QWERT, KingGamingYT
 * @description Shows how much time you are in a voice chat.
 * @version 1.0.2
 */ 

const { Data, Webpack, React, Patcher, DOM, UI, Utils, ContextMenu } = BdApi;
const { createElement, Component } = React;

const PanelSubtext = Webpack.getModule(m => m?.$$typeof?.toString() === "Symbol(react.forward_ref)"
    && m.render?.toString().includes("createHref"), {searchExports: true});
const Dispatcher = Webpack.getByKeys('dispatch', 'subscribe', 'register', { searchExports: true });
const SelectedChannelStore = Webpack.getStore('SelectedChannelStore');
const rtcClasses = Webpack.getByKeys('rtcConnectionStatus', 'ping');
const panelContainerClasses = Webpack.getByKeys('connection', 'inner');
let lastVoice, lastState;

class Timer extends Component {
    constructor(props) {
        super(props);
        this.connected = this.connected.bind(this);
        this.state = {
            startTime: 0,
            delta: 0
        };
    }

    connected(e) {
        if (e.state && e.state === 'RTC_DISCONNECTED' && !e.hasOwnProperty('streamKey')) {
            this.setState((prev) => (
                prev.startTime = Date.now()
            ));
        }
    }

    componentDidMount() {
        if(lastVoice === SelectedChannelStore.getVoiceChannelId()) {
            Dispatcher.subscribe('RTC_CONNECTION_STATE', this.connected);
            this.setState(lastState);
            this.interval = setInterval(() => {
                this.setState((prev) => (prev.delta = Math.round((Date.now() - prev.startTime) / 1000) * 1000));
                this.setState((prev) => prev.lastVoice = SelectedChannelStore.getVoiceChannelId());
            }, 1000);
        }else{
            this.setState((prev) => (
                prev.startTime = Date.now()));
            Dispatcher.subscribe('RTC_CONNECTION_STATE', this.connected);
            this.interval = setInterval(() => {
                this.setState((prev) => (prev.delta = Math.round((Date.now() - prev.startTime) / 1000) * 1000));
                this.setState((prev) => prev.lastVoice = SelectedChannelStore.getVoiceChannelId());
            }, 1000);
        }
    }

    componentWillUnmount() {
        Dispatcher.unsubscribe('RTC_CONNECTION_STATE', this.connected);
        lastVoice = this.state.lastVoice;
        lastState = this.state;
        setTimeout(() => {
            lastVoice = null;
            lastState = {};
        }, 1000)
        clearInterval(this.interval);
    }

    render() {
        return createElement("div", { className: "voiceTimer" }, `Time elapsed: ${new Date(this.state.delta).toISOString().substring(11, 19)}`);
    }
}

const voiceTimerCSS = 
`
    .${rtcClasses.rtcConnectionStatus}, .${panelContainerClasses.inner}, .${panelContainerClasses.connection} {
        height: fit-content;
    }
    .${panelContainerClasses.channel} {
        text-decoration: none !important;
    }
    .${panelContainerClasses.channel} > div:nth-child(1):hover {
        text-decoration: underline;
    }
    .voiceTimer {
        margin-top: 4px;
    }

`

module.exports = class CallTimeCounter {
    constructor() {}

    start() {
        DOM.addStyle('voiceTimer', voiceTimerCSS);
        Patcher.before('CallTimeCounter', PanelSubtext, "render", (that, [props], res) => { 
            if (!props?.children?.props?.className?.includes("channel")) return;
            props.children.props.children = [
                props.children.props.children,
                createElement(Timer, { className: "voiceTimer" })
            ]
        })
    }

    stop() {
        Patcher.unpatchAll('CallTimeCounter');
        DOM.removeStyle('voiceTimer');
    }
}
