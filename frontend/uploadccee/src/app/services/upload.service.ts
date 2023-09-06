import { Injectable } from '@angular/core';
import { HttpClient, HttpRequest, HttpEvent, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';


const baseUrl = 'http://localhost:7388';

const AUTH_USER = 'user';
const AUTH_PASSWORD = 'password';
const HTTP_OPTIONS = {
  headers: new HttpHeaders({
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Methods': '*',    
    'Access-Control-Allow-Headers' : '*',
    Authorization: 'Basic ' + btoa(AUTH_USER + ':' + AUTH_PASSWORD)
  })
};

@Injectable({
  providedIn: 'root'
})
export class UploadService {

  constructor(private http: HttpClient) { }


  upload(file: File): Observable<HttpEvent<any>> {

    const formData: FormData = new FormData();
    formData.append('file', file);

    return this.http.post(`api/agente`, formData, {
      reportProgress: true,
      observe: 'events',
    } );

  }

  
}
