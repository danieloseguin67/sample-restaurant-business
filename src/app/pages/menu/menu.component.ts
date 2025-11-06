import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslatePipe } from '../../pipes/translate.pipe';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [TranslatePipe, CommonModule],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.scss'
})
export class MenuComponent {
  activeTab: string = 'starters';

  setActiveTab(tab: string): void {
    this.activeTab = tab;
  }
}
