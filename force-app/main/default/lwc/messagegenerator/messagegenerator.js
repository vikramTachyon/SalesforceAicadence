import { LightningElement, track } from 'lwc';

export default class MessageGenerator extends LightningElement {

    @track username = 'Trailblazer';
    @track message = 'Hello Trailblazer';

    handleChange(event) {
        this.username = event.target.value;
        this.message = 'Hello ' + this.username;

        // send message to parent
        this.dispatchEvent(
            new CustomEvent('messagechange', {
                detail: this.message
            })
        );
    }
}