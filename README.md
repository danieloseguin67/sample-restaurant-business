# Restaurant Business - Angular Template

A professional Angular 17 template website for restaurant industry businesses with multi-language support and comprehensive features.

## Features

- ✅ **Multi-language Support**: Available in English, French, and Spanish
- ✅ **Responsive Design**: Mobile-friendly layout
- ✅ **Modern UI**: Clean and professional interface
- ✅ **Complete Menu System**: Organized by categories with prices and dietary info
- ✅ **Reservation System**: Online booking form ready for integration
- ✅ **Gallery Pages**: Sections for food, ambiance, and events
- ✅ **Events & Promotions**: Showcase special events and offers
- ✅ **Customer Reviews**: Display testimonials and external review links
- ✅ **Database Ready**: SQL Server integration setup
- ✅ **Internationalization**: Complete i18n implementation using ngx-translate

## Project Structure

```
restaurant-business/
├── src/
│   ├── app/
│   │   ├── components/
│   │   │   ├── header/              # Navigation header with all menu items
│   │   │   ├── footer/              # Footer component with hours
│   │   │   └── language-switcher/   # Language selection component
│   │   ├── pages/
│   │   │   ├── home/                # Homepage with featured dishes
│   │   │   ├── menu/                # Full menu with categories
│   │   │   ├── about/               # Restaurant story and team
│   │   │   ├── reservations/        # Online booking form
│   │   │   ├── gallery/             # Photo gallery sections
│   │   │   ├── events/              # Special events and promotions
│   │   │   ├── reviews/             # Customer testimonials
│   │   │   └── contact/             # Contact information and map
│   │   ├── services/
│   │   │   └── database.service.ts  # Database service for backend API
│   │   ├── app.routes.ts            # Route configuration
│   │   └── app.component.ts         # Main app component
│   └── assets/
│       └── i18n/                    # Translation files (en, fr, es)
├── server.js                        # Backend server example (SQL Server)
└── DATABASE_SETUP.md                # Database setup instructions
```

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Run Development Server

```bash
npm start
# or
ng serve
```

Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

### 3. Build for Production

```bash
npm run build
```

The build artifacts will be stored in the `dist/` directory.

## Pages & Features

### 🏠 Home
- Welcome message and restaurant tagline
- Featured signature dishes
- Opening hours
- Call-to-action button to view full menu

### 🍽️ Menu
Complete menu organized by categories:
- **Starters** (Appetizers, Soups, Salads)
- **Mains** (Fish, Pasta, Vegetarian options)
- **Burgers & Sandwiches**
- **Desserts**
- **Beverages** (Wine, Beer, Coffee, Juices)
- Dietary and allergen information

### 👥 About Us
- Restaurant story and history
- Mission statement
- Chef biography and introduction
- Awards and recognitions

### 📅 Reservations
- Online reservation form
- Walk-in information
- Group bookings and private events
- Contact information for immediate assistance

### 📸 Gallery
- Organized tabs for Food, Ambiance, and Events
- Placeholder for image integration
- Ready for photo uploads

### 🎉 Events & Promotions
- Upcoming special events (Wine Tasting, Live Jazz, Brunch)
- Current promotions (Happy Hour, Birthday Special, Loyalty Program)
- Event schedules and descriptions

### ⭐ Reviews
- Customer testimonials with ratings
- Links to external review platforms (Google, Yelp, TripAdvisor)
- Call-to-action for leaving reviews

### 📞 Contact
- Restaurant address
- Phone and email
- Opening hours
- Social media links
- Newsletter signup
- Map placeholder for Google Maps integration

## Multi-Language Support

The application supports three languages:
- **English** (en) - Default
- **French** (fr) - Français
- **Spanish** (es) - Español

### Using the Language Switcher

Click the language buttons in the header to switch between languages. The application will remember your language preference.

### Translation Files

Translation files are located in `src/assets/i18n/`:
- `en.json` - English translations
- `fr.json` - French translations (Français)
- `es.json` - Spanish translations (Español)

All restaurant content including menu items, descriptions, and prices are fully translated.

To add more languages:
1. Create a new JSON file in `src/assets/i18n/`
2. Add the language to the `languages` array in `language-switcher.component.ts`
3. Update the `supportedLangs` array in `app.component.ts`

## Database Connection

The application is configured to connect to SQL Server for dynamic content:

- **Server**: localhost
- **User**: developer
- **Password**: Storedindotenv
- **Database**: restaurant_business

⚠️ **Security Note**: Direct database connections from the frontend are not recommended. Please see `DATABASE_SETUP.md` for proper backend setup instructions.

### Backend Setup

1. **Install backend dependencies**:
   ```bash
   npm install express mssql cors
   ```

2. **Start the backend server**:
   ```bash
   node server.js
   ```

3. **See full setup instructions**: Refer to `DATABASE_SETUP.md`

## Restaurant Information

The template includes placeholder information that should be customized:

- **Name**: The Gourmet Bistro (Le Bistro Gourmet / El Bistró Gourmet)
- **Address**: 7227 Newman Boulevard, Unit 1504, Montreal, Quebec, H8N 0H7
- **Phone**: (514) 555-0123
- **Email**: info@gourmetbistro.com
- **Hours**: Mon-Fri 11AM-10PM, Sat-Sun 10AM-11PM

## Customization

### Update Restaurant Information
1. Edit translation files in `src/assets/i18n/` with your restaurant's information
2. Update prices, menu items, and descriptions
3. Modify contact details and hours

### Add Images
- Add food photos to `src/assets/images/food/`
- Add ambiance photos to `src/assets/images/ambiance/`
- Update gallery component to display images

### Integrate with Third-Party Services
- **Reservations**: Connect to OpenTable, Resy, or custom booking system
- **Online Ordering**: Integrate Uber Eats, DoorDash, or in-house system
- **Maps**: Add Google Maps API integration
- **Reviews**: Link to actual review profiles

## Running Tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Technology Stack

- **Angular**: 17.3.0
- **TypeScript**: 5.4.2
- **ngx-translate**: 15.0.0 (for internationalization)
- **MSSQL**: Latest (for SQL Server connectivity)
- **SCSS**: For styling

## Further Development

### Code Scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

### Suggested Enhancements

- [ ] Add image galleries with actual photos
- [ ] Integrate real reservation system (OpenTable, Resy)
- [ ] Add online ordering functionality
- [ ] Connect to Google Maps API
- [ ] Implement newsletter signup backend
- [ ] Add blog/news section
- [ ] Create gift card purchase system
- [ ] Build loyalty program integration
- [ ] Add live chat or chatbot
- [ ] Implement user authentication for reservations
- [ ] Create admin panel for menu management
- [ ] Add SEO optimization
- [ ] Implement analytics tracking

## Support

For more help on Angular CLI, use `ng help` or check out the [Angular CLI Documentation](https://angular.io/cli).

## License

This project is a template and can be freely used and modified for your restaurant business needs.
