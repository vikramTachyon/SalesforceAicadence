import { LightningElement } from 'lwc';

export default class IframeTabLwc extends LightningElement {

    iframeUrl = 'https://demo.zime.ai'; // MUST allow iframe
    showIframe = false;

    loadIframe() {
        this.showIframe = true;
    }
}