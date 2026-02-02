import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import COUNTER_CHANNEL from '@salesforce/messageChannel/counterChannel__c';

export default class CounterPublisher extends LightningElement {
    @wire(MessageContext)
    messageContext;

    add() {
        publish(this.messageContext, COUNTER_CHANNEL, { action: 'add' });
    }

    subtract() {
        publish(this.messageContext, COUNTER_CHANNEL, { action: 'subtract' });
    }
}