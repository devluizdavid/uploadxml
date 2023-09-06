import { Component, OnInit } from '@angular/core';
import { HttpEventType, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UploadService } from 'src/app/services/upload.service';
import { UploadedFile } from 'src/app/models/UploadedFile'; // Importe o modelo de Pessoa

@Component({
  selector: 'app-upload-file',
  templateUrl: './upload-file.component.html',
  styleUrls: ['./upload-file.component.css']
})
export class UploadFileComponent {
  
  currentFile: File | undefined;
  progress = 0;
  message = '';

  fileName = 'Selecione um arquivo';
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
    this.fileName = 'Selecione um arquivo';
  }
}
 
 
  upload(): void {
    this.progress = 0;
    this.message = "";

    if (this.currentFile) {
      this.uploadService.upload(this.currentFile).subscribe(
        (event: any) => {
          if (event.type === HttpEventType.UploadProgress) {
            this.progress = Math.round(100 * event.loaded / event.total);
          } else if (event instanceof HttpResponse) {
            this.message = event.body.message;
           // this.fileInfos.push(this.currentFile);
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
