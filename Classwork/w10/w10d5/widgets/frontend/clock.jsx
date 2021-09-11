import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props)
        this.state = {time: new Date()}
        this.tick = this.tick.bind(this)
        this.clock = undefined;
    }

    tick() {
        this.setState({time: new Date()})
    }

    render() {
        return (
            <div>
                <h1>Clock</h1>
                {this.state.time.getMonth()}, {this.state.time.getDate()}, {this.state.time.getFullYear()}<br />
                {this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}
            </div>
        )
    }

    componentDidMount() {
        this.clock = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.clock);
    }
}




export default Clock;