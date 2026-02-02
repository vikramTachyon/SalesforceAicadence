import { LightningElement } from 'lwc';

export default class CadenceRecentActivity extends LightningElement {
    activities = [
        { id: 1, name: 'Replied: Sarah Jenkins', desc: 'Inquiry about SalesAI', time: '2 hours ago' },
        { id: 2, name: 'Replied: Alex Ray', desc: 'Pricing follow-up', time: '3 hours ago' }
    ];
}