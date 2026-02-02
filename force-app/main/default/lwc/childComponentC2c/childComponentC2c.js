import { LightningElement } from 'lwc';

export default class ChildComponentC2c extends LightningElement {

    handleSubtract() {
        this.dispatchEvent(new CustomEvent('subtract'));
    }

    handleAddition() {
        this.dispatchEvent(new CustomEvent('add'));
    }
}