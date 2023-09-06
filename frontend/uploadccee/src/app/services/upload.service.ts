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

   return this.http.post<any>(`${baseUrl}/agente`, formData);
  }

  
}
