# Reglas para agentes en este vault

Este repositorio es un vault de Obsidian: el mapa de cómo se construye y mantiene el escritorio Niri + Clavis sobre Omarchy. Debe coincidir con lo que realmente está aplicado en la máquina.

## Git

- Rama por defecto: `master` (nunca `main`).
- Nunca commit directo a `master`: rama auxiliar → push → PR a `master` → rebase sobre el `master` más reciente → merge → borrar la rama local y remota.
- Sin trailers `Co-authored-by` ni atribución a agentes. Si el entorno los inyecta en `git commit`, usar `git commit-tree "$(git write-tree)" -p HEAD -m "..."` + `git update-ref refs/heads/<rama> <sha>`.
- Las mismas reglas aplican a `robert-flo/niri-dotfiles` (`master`) y a los forks (`personal`).

## Fuentes y upstream

- `niri-edge`, `quickshell` (Clavis) y `key-cli` se compilan desde los forks de `robert-flo`, rama `personal` (ver `05 - Referencias y Atajos/05.2`).
- **Nunca abrir pull requests a StatIndet**: no acepta PRs hechos con IA. Los cambios entran por PR a `personal` del fork.

## Entorno

- Usuarios: `niri` = producción, `sura` = pruebas visuales (desechable, se recrea desde dotfiles), `gracie` = administración + Omarchy/Hyprland.
- Configuración de usuario de `niri`/`sura`: `robert-flo/niri-dotfiles` con dotbare. Los cambios se prueban en `sura`, entran por PR y `niri` hace pull. Lo que pueda vivir en los dotfiles vive ahí, no en este vault.
- Archivos de sistema (fuera de `$HOME`): copia exacta en `assets/system/<ruta absoluta>`. Si cambias uno en la máquina, actualiza su copia y la nota que lo explica (`05.4`).

## Formato de las notas

- Frontmatter YAML (`title`, `tags`, `aliases`, `date`), callouts de Obsidian (`> [!NOTE]`, `> [!WARNING]`…), wikilinks `[[Nota|texto]]` (en tablas, `\|`).
- Cada nota abre con su bloque de navegación y se enlaza desde `00 - Indice General (MOC).md`; nuevas notas también van al árbol del `README.md`.
- Las notas `PENDIENTE - *.md` son de trabajo local y no se versionan (`.git/info/exclude`).
