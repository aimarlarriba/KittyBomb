🌐 **Language / Idioma:** [English](README.md) • [Español](README.es.md)

<p align="center">
  <img src="src/viewController/Imagenes/title.png" width="460" alt="Logo de KittyBoom"/>
</p>

<h3 align="center">🐾 Videojuego Arcade Retro Inspirado en Bomberman Desarrollado en Java</h3>

<p align="center">
  Un completo juego de escritorio diseñado e implementado bajo estrictos principios de <b>Ingeniería de Software</b>, arquitectura <b>Modelo-Vista-Controlador (MVC)</b>, <b>Patrones de Diseño GoF</b> y sprites originales de pixel-art.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Java-21%2B%20%7C%2017%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Versión de Java"/>
  <img src="https://img.shields.io/badge/Arquitectura-MVC-007ACC?style=for-the-badge" alt="Arquitectura MVC"/>
  <img src="https://img.shields.io/badge/Patrones%20de%20Diseño-GoF-2ea44f?style=for-the-badge" alt="Patrones GoF"/>
  <img src="https://img.shields.io/badge/GUI-Java%20Swing-E76F51?style=for-the-badge" alt="Java Swing"/>
  <img src="https://img.shields.io/badge/Licencia-MIT-yellow?style=for-the-badge" alt="Licencia MIT"/>
</p>

---

## 📌 Tabla de Contenidos
1. [Visión General y Aspectos Destacados](#-visión-general-y-aspectos-destacados)
2. [Demostración Visual y Jugabilidad](#-demostración-visual-y-jugabilidad)
3. [Controles y Mecánicas](#-controles-y-mecánicas)
4. [Arquitectura de Software y Patrones GoF](#-arquitectura-de-software-y-patrones-gof)
5. [Estructura del Proyecto](#-estructura-del-proyecto)
6. [Instalación y Ejecución Rápida](#-instalación-y-ejecución-rápida)
7. [Equipo de Ingeniería y Roles](#-equipo-de-ingeniería-y-roles)
8. [Contexto Académico y Licencia](#-contexto-académico-y-licencia)

---

## 🌟 Visión General y Aspectos Destacados

**KittyBoom** reinventa la fórmula arcade clásica de Bomberman con un toque felino. Desarrollado colaborativamente por estudiantes de ingeniería informática, el proyecto prioriza la **calidad de código, modularidad, alta cohesión y bajo acoplamiento** por encima de scripts de juego ad-hoc.

* **Diseño Orientado a Objetos Puro:** Cero clases monolíticas "dios". Los comportamientos de las entidades se delegan en componentes especializados mediante estrategias y estados.
* **Sincronización Reactiva de UI:** Utiliza el **Patrón Observer** para desacoplar las actualizaciones de alta frecuencia del bucle de juego respecto a los componentes gráficos de Swing.
* **Sistema Extensible de Entidades:** Bloques, bombas y personajes se instancian dinámicamente mediante abstracciones de factoría (**Factory Pattern**).
* **Pixel Art y Animaciones Propias:** Sprites 100% originales, GIFs animados para estados de personajes, fondos de niveles y batallas de jefes finales multifase.
* **Cero Dependencias Externas:** Desarrollado exclusivamente sobre la biblioteca estándar de Java (SE 17/21) y Swing, garantizando portabilidad multiplataforma sin motores de juego pesados.

---

## 🎮 Demostración Visual y Jugabilidad

### Selección de Personaje y Menú
<p align="center">
  <img src="src/viewController/Imagenes/back.gif" width="380" alt="Pantalla de menú animada"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="src/viewController/Imagenes/seleccion.png" width="380" alt="Selección de nivel"/>
</p>

| Gato Blanco Bomberman (`BomberManBlanco`) | Gato Negro Bomberman (`BomberManNegro`) |
| :---: | :---: |
| <img src="src/viewController/Imagenes/bomber1.png" width="140" alt="Gato Blanco"/> | <img src="src/viewController/Imagenes/bomber2.png" width="140" alt="Gato Negro"/> |
| Estilo de juego ágil y conjunto de sprites exclusivo | Bombardero táctico con efectos de explosión personalizados |

### Batallas Multinivel y Encuentros con Jefes Finales
El juego incluye generación de bloques en cuadrícula y fases dedicadas con jefes finales guiados por máquinas de estados:

<p align="center">
  <img src="src/viewController/Imagenes/stageBack1.png" width="260" alt="Nivel 1"/>
  <img src="src/viewController/Imagenes/stageBack2.png" width="260" alt="Nivel 2"/>
  <img src="src/viewController/Imagenes/stageBack4.png" width="260" alt="Nivel Jefe"/>
</p>

<p align="center">
  <img src="src/viewController/Imagenes/invocacionBoss.gif" width="180" alt="Invocación de Jefe"/>
  <img src="src/viewController/Imagenes/despertar.gif" width="180" alt="Despertar de Jefe"/>
  <img src="src/viewController/Imagenes/tieso.gif" width="180" alt="Combate contra Jefe"/>
  <img src="src/viewController/Imagenes/muerto.gif" width="180" alt="Jefe Derrotado"/>
</p>

---

## 🕹️ Controles y Mecánicas

| Contexto | Acción | Tecla / Control |
| :--- | :--- | :--- |
| **Menú Principal** | Iniciar Partida / Seleccionar | `Enter` / Clic Izquierdo |
| **Jugador 1** | Movimiento (Arriba, Abajo, Izquierda, Derecha) | `W`, `S`, `A`, `D` |
| **Jugador 1** | Colocar Bomba | `Barra Espaciadora` |
| **Jugador 2 (Coop)** | Movimiento | Flechas de Dirección |
| **Jugador 2 (Coop)** | Colocar Bomba | `Enter` / `Shift Derecho` |

---

## 🏛️ Arquitectura de Software y Patrones GoF

El diseño del sistema aplica patrones de diseño de la banda de los cuatro (**GoF**) para garantizar extensibilidad:

```text
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│     Model       │ <---> │   Controller    │ <---> │      View       │
│  (Casillas,     │       │  (Game Loop,    │       │ (Swing Panels,  │
│   Tablero,      │       │   Event Bus,    │       │  Renderers,     │
│   Entidades)    │       │   Input Mapper) │       │  Animators)     │
└─────────────────┘       └─────────────────┘       └─────────────────┘
```

1. **Patrón Observer:** La clase `Tablero` actúa como sujeto observable, notificando a `Pantalla` y sus subcomponentes cada vez que un bloque cambia de estado, se detona una bomba o se mueve un personaje.
2. **Patrón Factory:**
   * `BomberManFactory`: Centraliza la instanciación de personajes (`Blanco` y `Negro`).
   * `BloqueFactory`: Gestiona la creación de bloques destruibles, indestructibles y barreras especiales.
   * `BombaFactory`: Fabrica bombas estándar (`BSuper`) o de máxima potencia (`BUltra`).
3. **Patrón Strategy:** Define algoritmos intercambiables para el comportamiento de detonación y la resistencia de los bloques ante el fuego de las explosiones.
4. **Patrón State:** Controla las transiciones de las casillas (`Vacio`, `Blando`, `Duro`, `Explosion`, `Invocacion`).

---

## 📂 Estructura del Proyecto

```text
KittyBoom/
├── src/
│   ├── main/                  # Punto de entrada de la aplicación Java (main.java)
│   ├── model/                 # Dominio y lógica de negocio pura
│   │   ├── Bloques/           # Entidades de bloques y estrategias de colisión
│   │   ├── Bombas/            # Lógica de bombas, temporizadores y explosiones
│   │   ├── BomberMans/        # Entidades jugables y factoría de personajes
│   │   ├── Casillas/          # Máquinas de estado de casillas de tablero
│   │   ├── Mobs/              # Inteligencia artificial de enemigos y jefes
│   │   └── Tableros/          # Lógica matricial del tablero y observadores
│   └── viewController/        # Interfaz de usuario Swing y recursos gráficos
│       ├── Bomberman/         # Sprites de animación de personajes
│       ├── Imagenes/          # Fondos de pantalla, pantallas de título y GIFs
│       ├── Objetos/           # Sprites de bombas, bloques y power-ups
│       └── Pantallas/         # Paneles Swing (PantallaInicio, Selección...)
├── build_jar.bat              # Script de compilación y empaquetado JAR para Windows
├── run.bat                    # Script de ejecución directa en Windows
├── run.sh                     # Script de ejecución para Linux / macOS
├── LICENSE                    # Licencia MIT
└── README.md                  # Documentación principal en inglés
```

---

## ⚙️ Instalación y Ejecución Rápida

### Prerrequisitos
* **Java Development Kit (JDK):** Versión 17 o 21+.

### 1. Clonar el repositorio
```bash
git clone https://github.com/aimarlarriba/KittyBoom.git
cd KittyBoom
```

### 2. Ejecutar mediante scripts directos:
* **En Windows:**
  ```cmd
  run.bat
  ```
* **En Linux / macOS:**
  ```bash
  chmod +x run.sh
  ./run.sh
  ```

### 3. Compilar el archivo ejecutable (`.jar`):
* En Windows, ejecuta:
  ```cmd
  build_jar.bat
  ```
  Esto generará `KittyBoom.jar` en la raíz, que podrás ejecutar con doble clic o mediante:
  ```bash
  java -jar KittyBoom.jar
  ```

---

## 👥 Equipo de Ingeniería y Roles

* **Aimar Larriba:** Arquitectura del juego, bucle de sincronización con Observer, diseño de sprites pixel-art y mecánicas de bombas.
* **David Miguez:** Lógica de tableros, gestión de colisiones matriciales y físicas de entidades.
* **Xabier Garmendia:** Lógica de enemigos, estados de invocación de jefes y animaciones.

---

## 📜 Contexto Académico y Licencia

Desarrollado como proyecto de ingeniería de software para la **Universidad del País Vasco (UPV/EHU)**. 

Distribuido bajo la Licencia **MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.
