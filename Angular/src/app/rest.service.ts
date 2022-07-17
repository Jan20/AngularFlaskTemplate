import { HttpClient } from '@angular/common/http'
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Message } from './models/message';

@Injectable({
  providedIn: 'root'
})
export class RestService {

  constructor(private readonly httpClient: HttpClient) { }

  public fetchMessage(): Observable<Message> {
    return this.httpClient.get<Message>('http://localhost:8080')
  }
}
