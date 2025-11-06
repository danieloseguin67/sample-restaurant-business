import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, firstValueFrom } from 'rxjs';

export interface Translations {
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class TranslationService {
  private currentLang = 'en';
  private translations: { [lang: string]: Translations } = {};
  private langChangeSubject = new BehaviorSubject<string>(this.currentLang);
  private translationsLoaded = new BehaviorSubject<boolean>(false);
  
  public onLangChange = this.langChangeSubject.asObservable();
  public translationsReady = this.translationsLoaded.asObservable();

  constructor(private http: HttpClient) {
    this.loadTranslations();
  }

  private async loadTranslations() {
    // Load translations from JSON files
    const langs = ['en', 'fr', 'es'];
    
    try {
      for (const lang of langs) {
        const translations = await firstValueFrom(
          this.http.get<Translations>(`assets/i18n/${lang}.json`)
        );
        this.translations[lang] = translations;
      }
      this.translationsLoaded.next(true);
    } catch (error) {
      console.error(`Failed to load translations from assets/i18n/ directory:`, error);
      console.error('Please ensure translation JSON files exist in the assets/i18n folder.');
      // Set a flag to indicate translations failed to load
      this.translationsLoaded.next(false);
    }
  }

  setDefaultLang(lang: string): void {
    this.currentLang = lang;
  }

  use(lang: string): void {
    this.currentLang = lang;
    this.langChangeSubject.next(lang);
  }

  get(key: string, lang?: string): string {
    const language = lang || this.currentLang;
    const keys = key.split('.');
    let value: any = this.translations[language];
    
    for (const k of keys) {
      value = value?.[k];
    }
    
    // Return the value if found, otherwise return the key to indicate missing translation
    return value || key;
  }

  getCurrentLang(): string {
    return this.currentLang;
  }

  getBrowserLang(): string | undefined {
    if (typeof window !== 'undefined' && window.navigator) {
      return window.navigator.language.substring(0, 2);
    }
    return undefined;
  }
  
  isLoaded(): boolean {
    return this.translationsLoaded.value;
  }
}