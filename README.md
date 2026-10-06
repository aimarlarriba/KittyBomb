🌐 **Language / Idioma:** [English](README.md) • [Español](README.es.md)

<p align="center">
  <img src="src/viewController/Imagenes/title.png" width="460" alt="KittyBoom Logo"/>
</p>

<h3 align="center">🐾 Retro Bomberman-Inspired Arcade Game Engineered in Java</h3>

<p align="center">
  A feature-rich desktop game designed and implemented under strict <b>Software Engineering</b> principles, featuring <b>Model-View-Controller (MVC)</b> architecture, <b>GoF Design Patterns</b>, and original pixel-art assets.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Java-21%2B%20%7C%2017%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java Version"/>
  <img src="https://img.shields.io/badge/Architecture-MVC-007ACC?style=for-the-badge" alt="MVC Architecture"/>
  <img src="https://img.shields.io/badge/Design%20Patterns-GoF-2ea44f?style=for-the-badge" alt="GoF Design Patterns"/>
  <img src="https://img.shields.io/badge/GUI-Java%20Swing-E76F51?style=for-the-badge" alt="Java Swing"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="MIT License"/>
</p>

---

## 📌 Table of Contents
1. [Overview & Highlights](#-overview--highlights)
2. [Visual Showcase & Gameplay](#-visual-showcase--gameplay)
3. [Controls & Mechanics](#-controls--mechanics)
4. [Software Architecture & Design Patterns](#-software-architecture--design-patterns)
5. [Project Structure](#-project-structure)
6. [Quick Start & Execution](#-quick-start--execution)
7. [Engineering Team & Roles](#-engineering-team--roles)
8. [Academic Context & License](#-academic-context--license)

---

## 🌟 Overview & Highlights

**KittyBoom** reimagines the classic arcade Bomberman formula with a feline twist. Developed collaboratively by computer engineering students, the project prioritizes **code quality, modularity, high cohesion, and low coupling** over ad-hoc game scripts.

* **Clean Object-Oriented Design:** Zero monolithic god-classes. Entity behaviors are delegated to specialized strategy and state components.
* **Reactive UI Synchronization:** Uses the **Observer Pattern** to decouple high-frequency game loop updates from Swing graphical components.
* **Extensible Entity System:** Blocks, bombs, and characters are dynamically provisioned through **Factory** abstractions.
* **Custom Pixel Art & Animations:** 100% original sprite work, animated GIFs for character states, stage backgrounds, and multi-phase Boss encounters.
* **Zero External Dependencies:** Built with pure Java Standard Library (SE 17/21) and Swing, allowing cross-platform portability without bulky runtime engines.

---

## 🎮 Visual Showcase & Gameplay

### Character Selection & Menu
<p align="center">
  <img src="src/viewController/Imagenes/back.gif" width="380" alt="Animated Menu Screen"/>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="src/viewController/Imagenes/seleccion.png" width="380" alt="Stage Selection"/>
</p>

| White Cat Bomber (`BomberManBlanco`) | Black Cat Bomber (`BomberManNegro`) |
| :---: | :---: |
| <img src="src/viewController/Imagenes/bomber1.png" width="140" alt="White Cat"/> | <img src="src/viewController/Imagenes/bomber2.png" width="140" alt="Black Cat"/> |
| Agile playstyle & signature sprite set | Tactical bomber & custom explosion effects |

### Multi-Stage Battles & Epic Boss Encounters
The game features procedural block layouts and dedicated Boss stages with dynamic state-driven animations:

<p align="center">
  <img src="src/viewController/Imagenes/stageBack1.png" width="260" alt="Stage 1"/>
  <img src="src/viewController/Imagenes/stageBack2.png" width="260" alt="Stage 2"/>
  <img src="src/viewController/Imagenes/stageBack4.png" width="260" alt="Boss Stage"/>
</p>

<p align="center">
  <img src="src/viewController/Imagenes/invocacionBoss.gif" width="180" alt="Boss Invocation"/>
  <img src="src/viewController/Imagenes/despertar.gif" width="180" alt="Boss Awakening"/>
  <img src="src/viewController/Imagenes/tieso.gif" width="180" alt="Boss Combat"/>
  <img src="src/viewController/Imagenes/muerto.gif" width="180" alt="Boss Defeated"/>
</p>

---

## 🕹️ Controls & Mechanics

| Context | Action | Key Binding |
| :--- | :--- | :--- |
| **Menu Screen** | Switch Character | <kbd>←</kbd> / <kbd>→</kbd> (Left / Right Arrow) |
| **Menu Screen** | Open Stage Options | <kbd>O</kbd> |
| **Menu Screen** | Start Selected Stage | <kbd>Enter</kbd> or <kbd>Space</kbd> |
| **In-Game** | Move Bomber Up | <kbd>W</kbd> or <kbd>↑</kbd> |
| **In-Game** | Move Bomber Down | <kbd>S</kbd> or <kbd>↓</kbd> |
| **In-Game** | Move Bomber Left | <kbd>A</kbd> or <kbd>←</kbd> |
| **In-Game** | Move Bomber Right | <kbd>D</kbd> or <kbd>→</kbd> |
| **In-Game** | Plant Bomb | <kbd>Space</kbd> |

---

## 🏗️ Software Architecture & Design Patterns

The codebase is strictly structured following the **Model-View-Controller (MVC)** architectural paradigm:

```mermaid
graph TD
    subgraph View ["🖥️ View / Controller (Swing)"]
        UI_Start[PantallaInicio]
        UI_Stage[PantallaSeleccionTipoTablero]
        UI_Game[Pantalla]
        UI_Cell[PanelCord - Grid 11x17]
    end

    subgraph Controller ["🎮 Event Handlers"]
        InputHandler[Controlador - KeyListener / ActionListener]
    end

    subgraph Model ["⚙️ Domain Model & Game Logic"]
        Board[Tablero - Singleton & Observable]
        Selection[Seleccion - Singleton & Observable]
        GridCell[CasillaTablero - Observable & State]
        Player[BomberMan - Blanco / Negro]
        Factory[Factories - Bloque / Bomba / BomberMan]
        Strategy[Strategy Algorithms - Bombas / Bloques]
        Mobs[Boss & Enemigos]
    end

    InputHandler -->|Dispatches Key Events| Board
    InputHandler -->|Dispatches Menu Events| Selection
    Board -->|Notifies Game State Changes| UI_Game
    GridCell -->|Notifies Tile Changes| UI_Cell
    Selection -->|Notifies Selection Changes| UI_Start
    Board --> GridCell
    Board --> Player
    Board --> Mobs
```

### Applied GoF Design Patterns

#### 1. Factory Pattern & Singleton Pattern
Creation of game entities is decoupled via dedicated factories to avoid tight coupling between components:
* `BloqueFactory`: Instantiates destructible, indestructible, empty, and boss barrier tiles (`Blando`, `Duro`, `Barrera`, `BloqueBoss`, `Vacio`).
* `BombaFactory`: Generates and arms special bombs (`BSuper`, `BUltra`).
* `BomberManFactory`: Instantiates character archetypes (`BomberManBlanco`, `BomberManNegro`).
* **Singleton** is enforced on `Tablero`, `Seleccion`, and all factories to ensure a centralized, single point of truth across the game lifecycle.

#### 2. Strategy Pattern
Algorithms for destructive radii and board initialization are encapsulated behind polymorphic interfaces:
* `StrategyBombas` (`StBSuper`, `StBUltra`): Implements interchangeable explosion blast patterns and block-clearing mechanics.
* `StrategyBloquesBlando` (`StBloquesBlandoClassic`, `StBloquesBlandoSoft`): Configures destructible block densities per map type.
* `StrategyBloquesDuro` (`StBloquesDuroClassic`, `StBloquesDuroBoss`): Governs indestructible layout geometries and Boss arenas.

#### 3. Observer Pattern
To eliminate tight coupling between business logic and UI rendering:
* `Tablero` (Observable) notifies `Pantalla` (Observer) when the remaining enemy count changes or special boss cinematics trigger.
* `CasillaTablero` (Observable) notifies individual `PanelCord` cells (Observer) to trigger targeted sprite repaint cycles without redrawing the entire screen.
* `Seleccion` (Observable) notifies `PantallaInicio` (Observer) whenever characters or options are toggled.

#### 4. State Pattern
* Managed through `CasillaTablero.cambiarCasilla(Casilla)`, allowing tiles to transition smoothly between empty space, active bomb countdowns, active fire explosions, bonus drops, and character collisions.

```mermaid
classDiagram
    direction LR

    class BloqueFactory {
        <<Singleton>>
        +generate(tipo: String): Bloque
    }
    class BombaFactory {
        <<Singleton>>
        +generate(tipo: String, i: int, j: int): Bomba
    }

    class StrategyBombas {
        <<Interface>>
        +destruirBloques(i: int, j: int)
    }
    class StBSuper {
        +destruirBloques(i: int, j: int)
    }
    class StBUltra {
        +destruirBloques(i: int, j: int)
    }

    class StrategyBloquesBlando {
        <<Interface>>
        +colocarBloquesBlandos()
    }
    class StBloquesBlandoClassic {
        +colocarBloquesBlandos()
    }
    class StBloquesBlandoSoft {
        +colocarBloquesBlandos()
    }

    StrategyBombas <|.. StBSuper
    StrategyBombas <|.. StBUltra
    StrategyBloquesBlando <|.. StBloquesBlandoClassic
    StrategyBloquesBlando <|.. StBloquesBlandoSoft

    BloqueFactory ..> Bloque : creates
    BombaFactory ..> Bomba : creates
    Bomba --> StrategyBombas : executes
```

---

## 📁 Project Structure

```text
KittyBoom/
├── src/                                     # Source Code & Assets
│   ├── main/
│   │   └── main.java                        # Application Bootstrap
│   ├── model/                               # Business & Game Logic (Domain)
│   │   ├── Bloques/                         # Tiles, Barriers, Strategy & Factory
│   │   ├── Bombas/                          # Bomb logic & explosion radius strategies
│   │   ├── BomberMans/                      # Player entities & customization factory
│   │   ├── Casillas/                        # Tile state management & explosion triggers
│   │   ├── Mobs/                            # Enemy AI & Boss finite state machine
│   │   └── Tableros/                        # Board matrix, stage controllers & selection
│   └── viewController/                      # Presentation Layer (Swing GUI)
│       ├── Bomberman/                       # Character sprite animation sheets
│       ├── Imagenes/                        # Background stages, titles & animated GIFs
│       ├── Objetos/                         # Bomb, balloon & obstacle sprite assets
│       └── Pantallas/                       # Swing Frames, Panels & Event Controllers
├── run.bat                                  # Windows 1-click launcher
├── run.sh                                   # Linux / macOS launcher
├── build_jar.bat                            # Standalone executable JAR generator
├── LICENSE                                  # MIT Open Source License
└── README.md                                # Project Documentation
```

---

## 🚀 Quick Start & Execution

### Prerequisites
* **Java Development Kit (JDK) 17 or higher** (Tested with OpenJDK / Oracle JDK 21).

### Option 1: One-Click Launch (Terminal)
Clone the repository and run the startup script for your operating system:

**Windows:**
```cmd
git clone https://github.com/aimarlarriba/KittyBoom.git
cd KittyBoom
run.bat
```

**Linux / macOS:**
```bash
git clone https://github.com/aimarlarriba/KittyBoom.git
cd KittyBoom
chmod +x run.sh
./run.sh
```

### Option 2: Running in Eclipse / IntelliJ IDEA
1. Open your IDE and choose **Import Existing Project** (or **Open Folder**).
2. Select the `KittyBoom` root directory.
3. Verify that `src` is marked as the **Source Root**.
4. Run `main.main` as a **Java Application**.

### Option 3: Build Standalone JAR
To create a portable, standalone executable `.jar` file:
```cmd
build_jar.bat
java -jar KittyBoom.jar
```

---

## 👥 Engineering Team & Roles

* **[Aimar Larriba](https://github.com/aimarlarriba)** — Software Architecture, Core Game Logic & Repository Lead.
* **Lou Gómez** — Software Development, Game Loop & Object-Oriented Modeling.
* **Iván Herrera** — Software Development & Complete Visual Design / Pixel-Art Assets.
* **Daniel Talmaci** — Software Architecture, Pattern Implementation & Event Controls.
* **David Miguez** — Software Architecture, Board State & Game Mechanics.

---

## 🎓 Academic Context & License

This project was engineered as part of the **Software Engineering** course within the **Degree in Management and Information Systems Computer Engineering** at the **University of the Basque Country (UPV/EHU)**.

Distributed under the **[MIT License](LICENSE)**. Feel free to explore, learn, and adapt the code for educational purposes.
