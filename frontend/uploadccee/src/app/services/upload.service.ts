import { Injectable } from '@angular/core';
import { HttpClient, HttpRequest, HttpEvent, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const baseUrl = 'http://localhost:7388';

const HTTP_OPTIONS = {
  headers: new HttpHeaders({
    'Access-Control-Allow-Origin': "*",
    'Access-Control-Allow-Methods': '*'
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

    const req = new HttpRequest('POST', `${baseUrl}/agente`, formData, HTTP_OPTIONS);

    return this.http.request(req);
  }

  getFiles(): Observable<any> {
    return this.http.get(`${baseUrl}/agente`);
  }
}
