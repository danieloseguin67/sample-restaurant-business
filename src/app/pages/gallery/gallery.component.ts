import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '../../pipes/translate.pipe';

@Component({
  selector: 'app-gallery',
  standalone: true,
  imports: [TranslatePipe, CommonModule],
  templateUrl: './gallery.component.html',
  styleUrl: './gallery.component.scss'
})
export class GalleryComponent {
  activeTab: string = 'food';

  setActiveTab(tab: string): void {
    this.activeTab = tab;
  }
}
