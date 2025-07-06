# URL Shortener Project (Linkraze)

## 🔗 Project Overview

Linkraze is a full-stack URL shortening application designed for effortless link generation, management, and analytics. The backend is built with Spring Boot and deployed via Docker, while the frontend uses React + Vite and is hosted on Netlify. Data persistence is powered by PostgreSQL on Neon.tech.

---

## 🛠️ Technologies & Dependencies

### ⚙️ Backend (Spring Boot)

* **Java 20** (Eclipse Temurin JDK)
* **Spring Boot**

  * spring-boot-starter-web
  * spring-boot-starter-data-jpa
  * spring-boot-starter-security
* **PostgreSQL** (JDBC Driver) via **Neon.tech**
* **JWT Authentication** (`io.jsonwebtoken:jjwt-api/impl/jackson`)
* **Lombok** (boilerplate reduction)
* **Hibernate** (JPA implementation)
* **Logging & Monitoring** (Spring Boot Logging Configuration)
* **CORS Configuration** (`WebMvcConfigurer`)
* **Testing**

  * spring-boot-starter-test
  * spring-security-test
* **Docker**

  * Multi-stage build using `eclipse-temurin:20` images
  * Dockerfile scripts for build and runtime stages

###### Key Backend Dependencies (pom.xml)

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
</dependency>
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
<dependency>
  <groupId>org.postgresql</groupId>
  <artifactId>postgresql</artifactId>
</dependency>
<dependency>
  <groupId>io.jsonwebtoken</groupId>
  <artifactId>jjwt-api</artifactId>
  <version>0.12.6</version>
</dependency>
<!-- ...and others listed in pom.xml -->
```

---

### 🎨 Frontend (React + Vite)

* **Node.js & npm**
* **Vite** (dev server & build tooling)
* **React** (UI library)
* **@vitejs/plugin-react** (JSX support)
* **Material UI** + **Emotion** (UI components & styling)
* **Tailwind CSS** + **PostCSS** + **Autoprefixer** (utility-first styling)
* **ESLint** + plugins (`@eslint/js`, `eslint-plugin-react`)
* **Axios** (HTTP client)
* **Chart.js** + **react-chartjs-2** (data visualization)
* **Day.js** (date handling)
* **Framer Motion** (`motion`) (animations)
* **react-copy-to-clipboard** (clipboard integration)

###### Key Frontend Dependencies (package.json)

```json
{
  "dependencies": {
    "react": "^18.x",
    "@mui/material": "^5.x",
    "axios": "^1.x",
    "chart.js": "^4.x",
    "dayjs": "^1.x",
    "react-chartjs-2": "^5.x",
    "react-copy-to-clipboard": "^5.x"
  },
  "devDependencies": {
    "vite": "^4.x",
    "tailwindcss": "^4.x",
    "postcss": "^8.x",
    "autoprefixer": "^10.x",
    "eslint": "^8.x"
  }
}
```

---

## 🚀 Deployment & Hosting

* **Backend**: Containerized with Docker. Multi-stage Dockerfile builds the JAR, then runs on a lightweight JRE image. Deploy to any Docker-compatible host.
* **Frontend**: Deployed on **Netlify** with continuous deployment from the GitHub repository.
* **Database**: **PostgreSQL** instance hosted on **Neon.tech**. Connection configured via environment variables.

---

## ⚙️ Environment & Configuration

Create a `.env` file in the project root (or configure environment variables):

```dotenv
# Backend
DATABASE_URL=jdbc:postgresql://<your-neon-host>/<db-name>
DATABASE_USERNAME=<username>
DATABASE_PASSWORD=<password>
DATABASE_DIALECT=org.hibernate.dialect.PostgreSQLDialect
JWT_SECRET=<your_jwt_secret>

# Frontend
VITE_API_BASE_URL=https://api.yourdomain.com
```

Spring Boot will load these via:

```properties
spring.config.import=optional:dotenv:./.env
```

---

## 📂 Project Structure

```
urlShortener/            # Monorepo root
├── backEnd/             # Spring Boot application
│   ├── src/main/java   
│   ├── Dockerfile      
│   └── pom.xml         
├── frontEnd/            # React + Vite application
│   ├── src/
│   ├── package.json    
│   └── tailwind.config.js
└── README.md            # (this file)
```

---

## 🛠️ Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/USER/urlShortener.git
cd urlShortener
```

### 2. Start the backend (Docker)

```bash
cd backEnd
docker build -t urlshortener-backend .
docker run -d --name urlshortener-backend -p 8080:8080 \
  -e DATABASE_URL=$DATABASE_URL \
  -e DATABASE_USERNAME=$DATABASE_USERNAME \
  -e DATABASE_PASSWORD=$DATABASE_PASSWORD \
  -e JWT_SECRET=$JWT_SECRET \
  urlshortener-backend
```

### 3. Start the frontend (Netlify / Local)

**Local:**

```bash
cd frontEnd
npm install
npm run dev
```

**Production:** Push to `main`, and Netlify will auto-deploy from the `frontEnd` folder.

---

## 🎓 Credits & Acknowledgements

* Built with [Spring Boot](https://spring.io/projects/spring-boot) and [React](https://reactjs.org/).
* Styled with [Material UI](https://mui.com/) and [Tailwind CSS](https://tailwindcss.com/).
* Hosted on Docker, Netlify, and Neon.tech.

---

## 📄 License

This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.
