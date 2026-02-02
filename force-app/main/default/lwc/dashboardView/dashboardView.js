import { LightningElement, wire } from 'lwc';
import getEmailsSent from '@salesforce/apex/CadenceDashboardController.getEmailsSent';
import getReplies from '@salesforce/apex/CadenceDashboardController.getReplies';
import getRecentActivities from '@salesforce/apex/CadenceDashboardController.getRecentActivities';

export default class DashboardView extends LightningElement {
    emailsSent = 0;
    replies = 0;
    replyRate = 0;
    activities = [];

    @wire(getEmailsSent)
    wiredEmails({ data }) {
        if (data !== undefined) {
            this.emailsSent = data;
            this.calculateReplyRate();
        }
    }

    @wire(getReplies)
    wiredReplies({ data }) {
        if (data !== undefined) {
            this.replies = data;
            this.calculateReplyRate();
        }
    }

    @wire(getRecentActivities)
    wiredActivities({ data }) {
        if (data) {
            this.activities = data;
        }
    }

    calculateReplyRate() {
        if (this.emailsSent > 0) {
            this.replyRate = ((this.replies / this.emailsSent) * 100).toFixed(1);
        } else {
            this.replyRate = 0;
        }
    }
}