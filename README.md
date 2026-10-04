# KittyBomb

Videojuego de estrategia y acción desarrollado en Java que recrea la experiencia clásica de Bomberman, diseñado e implementado bajo estrictos principios de Ingeniería de Software. Este proyecto forma parte de la asignatura **Ingeniería del Software** del **Grado en Ingeniería Informática de Gestión y Sistemas de Información** en la **EHU**.

---

## 👥 Autores y Contribuciones

* **Aimar Larriba** — Desarrollo y arquitectura de software.
* **Lou Gómez** — Desarrollo y arquitectura de software.
* **Iván Herrera** — Desarrollo de software y creación íntegra de todo el arte y recursos visuales del juego.
* **Daniel Talmaci** — Desarrollo y arquitectura de software.
* **David Miguez** — Desarrollo y arquitectura de software.

---

## 🛠️ Arquitectura y Decisiones de Diseño

El proyecto ha sido estructurado siguiendo buenas prácticas de desarrollo para garantizar un código modular, mantenible y escalable:

### Patrón Arquitectónico Modelo-Vista-Controlador (MVC)
* `model`: Contiene toda la lógica de negocio, entidades del juego (jugadores, enemigos, bombas, bloques y casillas) y la gestión del tablero.
* `viewController`: Gestiona la interfaz gráfica, los controladores de eventos y la renderización de los elementos visuales.
* `main`: Punto de entrada principal de la aplicación.

### Patrones de Diseño Aplicados
* **Factory Pattern** (`BMFactory`, `BloqueFactory`, `BombaFactory`, `BomberManFactory`): Utilizado para desacoplar la creación de instancias complejas (bloques, tipos de bombas, enemigos y personajes) facilitando la escalabilidad del juego.
* **Strategy & State Pattern** (`StrategyBloques`, `StrategyBombas`, `StateCasilla`): Implementados para gestionar dinámicamente los diferentes comportamientos de los elementos del escenario y los estados de las casillas ante las interacciones del jugador y las explosiones.
* **Observer Pattern** (`ObserverTableroPantalla`): Utilizado para mantener sincronizada la lógica del tablero con la interfaz gráfica de forma desacoplada y eficiente.

### Programación Orientada a Objetos Avanzada
* Uso intensivo de polimorfismo, herencia e interfaces para estandarizar el comportamiento de los distintos elementos interactivos del mapa (bloques duros, blandos, vacíos, mejoras y enemigos con IA propia).

---

## 🚀 Características Técnicas y Tecnologías

* **Lenguaje:** Java
* **Entorno de Desarrollo / IDE:** Eclipse / IntelliJ IDEA
* **Control de Versiones:** Git / GitHub
* **Gestión de Proyecto:** Metodologías ágiles y diseño orientado a componentes

### Estructura de Paquetes
* `src/model/Bloques/`: Gestión de barreras, bloques destructibles e indestructibles.
* `src/model/Bombas/`: Mecánicas de detonación, radios de explosión y tipos de bombas especiales (`BSuper`, `BUltra`).
* `src/model/BomberMans/`: Control y personalización de los personajes.
* `src/model/Casillas/`: Lógica de casillas del tablero y gestión de explosiones e invocaciones.
* `src/model/Mobs/`: Modelado de enemigos y jefes (Boss).
* `src/model/Tableros/`: Gestión de la matriz del juego y pantallas de selección.
* `src/viewController/`: Controladores de vista y recursos gráficos originales diseñados a medida.
