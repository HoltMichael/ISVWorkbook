import {LightningElement, api, wire, track} from 'lwc';
import getPropertyAddress from '@salesforce/apex/PropertyUtils.getPropertyAddress';


export default class LightningExampleMapSingleMarker extends LightningElement {
    @api recordId;
    @track propertyLocs;
    @track error;


    @wire(getPropertyAddress, {recId: '$recordId'})
    wiredProperties({error,data}) {
        if (data) {
            this.propertyLocs = data;
            console.log(JSON.stringify(data, null, '\t'));
        } else if (error) {
            console.log('error');
            console.log(JSON.stringify(error, null, '\t'));
            this.error = error;
        }
    }
}