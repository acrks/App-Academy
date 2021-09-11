import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.tabs = [
            {title: "Tab1", content: "Content1"},
            {title: "Tab2", content: "Content2"},
            {title: "Tab3", content: "Content3"}
        ] 
        this.state = {selected: 0}
        this.selectTab = this.selectTab.bind(this)
    }

    selectTab() {
        console.log(this.tabs)
        // console.log(this.tabs.key)
        this.setState({selected: this})
        // console.log(this.state.selected)
    }

    render() {
        return(
            <div>
                <ul>
            {this.tabs.map((tab, i) => <h1 key={i} onClick={this.selectTab}>{tab.title}</h1>)}
            {this.tabs.map((tab, i) => <article key={i}>{tab.content}</article>)}
                </ul>
            </div>
        )}
}

export default Tabs;