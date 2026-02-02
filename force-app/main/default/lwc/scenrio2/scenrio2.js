import { LightningElement } from 'lwc';

export default class Scenario2 extends LightningElement {
    showSection = false;

    handleToggle(event) {
        this.showSection = event.target.checked;
    }
}