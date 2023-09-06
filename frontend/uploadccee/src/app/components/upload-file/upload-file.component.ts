import { Component, OnInit } from '@angular/core';
import { HttpEventType, HttpResponse } from '@angular/common/http';
import { Observable, catchError, map, throwError } from 'rxjs';
import { UploadService } from 'src/app/services/upload.service'; 
import { Upload } from 'src/app/models/Upload';

const LABEL_SELECIONAR_ARQUIVO = "Selecione um arquivo";
@Component({
  selector: 'app-upload-file',
  templateUrl: './upload-file.component.html',
  styleUrls: ['./upload-file.component.css']
})
export class UploadFileComponent {
  
   initialState: Upload = { state: 'PENDING', progress: 0 }
  
  currentFile: File | undefined;
  progress = 0;
  message = '';

  fileName = LABEL_SELECIONAR_ARQUIVO;
  fileInfos: File[] = [];


  constructor(private uploadService: UploadService) { 
  }

  ngOnInit() {
   
  }

  selectFile(event: any): void {
  if (event.target.files && event.target.files[0]) {
    const file: File = event.target.files[0];
    this.currentFile = file;
    this.fileName = this.currentFile.name;
  } else {
    this.fileName = LABEL_SELECIONAR_ARQUIVO;
  }
}
 
 
  upload(): void {
    this.progress = 1;
    
    if (this.currentFile) {
      this.uploadService.upload(this.currentFile).subscribe(
        (event: any) => {
          if (event.type === HttpEventType.UploadProgress) {
            this.progress = Math.round(100 * event.loaded / event.total);
          } else if (event instanceof HttpResponse) {
            this.message = event.body.message;
            this.currentFile = undefined;
            this.fileName = LABEL_SELECIONAR_ARQUIVO;
            
          }
        },
        (err: any) => {
          console.log(err);
          this.progress = 0;

          if (err.error && err.error.message) {
            this.message = err.error.message;
          } else {
            this.message = 'Could not upload the file!';
          }

          this.currentFile = undefined;
        });
    }


  
  }


}
