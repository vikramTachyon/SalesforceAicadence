import { LightningElement } from 'lwc';

export default class SalesforceAICadenceApp extends LightningElement {
    activeTab = 'home';

    get isHome() { return this.activeTab === 'home'; }
    get isLeads() { return this.activeTab === 'leads'; }
    get isCadences() { return this.activeTab === 'cadences'; }

    get homeClass() { return this.activeTab === 'home' ? 'active' : ''; }
    get leadsClass() { return this.activeTab === 'leads' ? 'active' : ''; }
    get cadencesClass() { return this.activeTab === 'cadences' ? 'active' : ''; }

    handleMenuClick(event) {
        this.activeTab = event.target.dataset.id;
    }
}