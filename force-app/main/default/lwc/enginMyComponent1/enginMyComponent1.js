import { LightningElement } from 'lwc';

export default class EnginMyComponent1 extends LightningElement {


name;
namehandler(event){
    this.name=event.target.value;
}

}