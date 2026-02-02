import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import COUNTER_CHANNEL from '@salesforce/messageChannel/counterChannel__c';

export default class CounterSubscriber extends LightningElement {
    count = 0;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        subscribe(this.messageContext, COUNTER_CHANNEL, (message) => {
            if (message.action === 'add') {
                this.count++;
            }
            if (message.action === 'subtract') {
                this.count--;
            }
        });
    }
}