import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { Message } from './models/message';
import { RestService } from './rest.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  public message: Observable<Message> = this.restService.fetchMessage();

  constructor(private readonly restService: RestService) {}
}
