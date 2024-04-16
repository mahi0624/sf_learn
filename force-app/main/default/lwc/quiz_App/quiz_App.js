import { LightningElement, track } from 'lwc';

export default class Quiz_App extends LightningElement {
    user='Mahendra'
    @track
    address={
        city:'Bengaluru',
        pincode:560037,
        country:'India'
    }
    a=10
    b=5
    isdata=false
    Changehandler(event){
        //this.user=event.target.value;
        this.address.city=event.target.value;
    }
    Changehandleruser(event){
        this.user=event.target.value;
        //this.address.city=event.target.value;
    }
    get multiply(){
      return this.a*this.b;
    }
    Showdata(){
        this.isdata=true;
    }
}