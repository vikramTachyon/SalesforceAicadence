import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {

    @track finalMessage = 'Hello Trailblazer';

    handleMessage(event) {
        this.finalMessage = event.detail;
    }
}