# product-discovery-claude-skills

Пак скілів для Claude під структуроване **product discovery** — спроєктований під **аутсорсингові проєкти** (BA / агенція / консультант, які працюють над клієнтським продуктом), але так само добре працює для внутрішніх продуктових команд.

25 скілів, організовані в 7 груп, можуть запускатись незалежно у будь-якій послідовності. Один foundation-скіл пише переюзний context-файл, який читають усі інші.

## Концепція

```
profile-builder  ──записує──▶  discovery-context.md
                                   │
                                   ▼
              кожен інший скіл його читає; не блокує, якщо файл відсутній
```

Кожен SKILL.md також має у frontmatter поле `pack: discovery-phase` і одно-рядковий банер у тілі (`> Part of the **discovery-phase** skill pack · <group> group · …`) — тож навіть при індивідуальному завантаженні ZIP у claude.ai видно, що скіл належить до цього паку.

## Групи скілів

| Група | Скіли | Що роблять |
|---|---|---|
| **Foundation** | `profile-builder`, `discovery-conductor` | Будують context-файл. Опціональний conductor веде по послідовності. |
| **Discovery** | `problem-framing`, `stakeholder-mapping`, `research-planning` | Формують проблему, визначають стейкхолдерів, планують як вчитись. |
| **Evidence** | `user-interviews`, `sme-workshops`, `competitive-scan`, `secondary-research`, `support-data-analysis` | Збирають докази — обираєте те, що фактично доступно за вашим рівнем доступу. |
| **Synthesis** | `insight-synthesis`, `personas`, `journey-mapping`, `opportunity-mapping`, `risk-assumption-mapping` | Перетворюють сирі докази на ранжовані теми, персони, journey-карти, можливості та ризики. |
| **Scoping** | `feature-scoping`, `mvp-definition`, `solution-architecture`, `estimation` | Визначають, що будувати, що — MVP проти PoC, як це спроектувати на high-level, і скільки це коштує. |
| **Validation** | `feasibility-spike`, `prototype-plan` | Закривають технічні / продуктові припущення до старту build-у. |
| **Deliverables** | `proposal`, `sow-draft`, `discovery-handoff`, `go-nogo-memo` | Комерційні + рішенські артефакти для клієнта і команди-приймача. |

Повний список скілів: див. [таблицю груп вище](#групи-скілів) або запустіть `./scripts/validate-skills.sh` для енумерації.

## Чому outsourcing-first?

Більшість product-discovery ресурсів припускають внутрішню команду з прямим доступом до користувачів. Реальні аутсорсингові проєкти виглядають інакше:

- Клієнт володіє проблемою; ви витягуєте її з брифу
- Кінцеві користувачі можуть бути недоступні — заміняєте інтерв'ю на SME-воркшопи, аналіз support-даних, secondary-research
- Власник рішення — клієнт, не агенція
- Вихід зазвичай — proposal / SoW / handoff, не GO/PIVOT/KILL memo
- Ризики розділені на client-owned, agency-owned, shared

Цей пак за замовчуванням працює саме з цією реальністю. Для внутрішнього продуктового використання ті самі скіли застосовуються без змін — foundation фіксує "ми внутрішні" у context-файлі, і кожен скіл адаптується.

## Сценарії використання

Пак не лінійний — він підлаштовується під типи engagement-ів. Нижче 5 сценаріїв, які покривають ~95% реальних кейсів. Кожен сценарій → відповідна послідовність у [conductor sequences](plugins/discovery-phase/skills/discovery-conductor/sequences.md).

### Сценарій 1 — Cold lead → виграти контракт _(sales motion, 1-2 тижні)_

Клієнт прийшов з RFP або питанням "скільки коштує побудувати X". Треба швидко обернути проблему на propositions, обґрунтувати оцінку і виграти proposal.

```
profile-builder → problem-framing → stakeholder-mapping →
research-planning → user-interviews + competitive-scan →
insight-synthesis → personas (lightweight) → opportunity-mapping →
risk-assumption-mapping → feature-scoping → solution-architecture →
estimation → proposal
```

→ Sequence A (`discovery-conductor`). Бюджетує мало часу на research, але зберігає structure: швидкий personas + solution-architecture дає клієнту відчуття серйозного підходу при tight-таймлайні.

### Сценарій 2 — Existing client, нова фіча _(continuous discovery, 1-3 тижні)_

Клієнт уже у delivery або staff-aug фазі, замовляє нову фічу. Доступ до користувачів зазвичай є, але дисципліни discovery немає — фіча приходить як "просто додай".

```
problem-framing → user-interviews + support-data-analysis →
insight-synthesis → personas (refresh) → journey-mapping →
opportunity-mapping → risk-assumption-mapping →
feature-scoping → estimation
```

Сильна сторона — `journey-mapping` робить очевидними точки інтервенції в поточному UX, а `risk-assumption-mapping` ловить припущення, які зазвичай тонуть у "давайте просто зробимо".

### Сценарій 3 — Tech feasibility unclear _(PoC track, 1-2 тижні)_

Клієнт або агенція не знає, чи технічно реалізовуване рішення. Discovery вузька — фокус на закритті топ-3 технічних припущень.

```
problem-framing → research-planning (proxy heavy) →
solution-architecture → feasibility-spike → prototype-plan →
go-nogo-memo
```

→ Sequence F (delivery-phase) частково. Personas/journey пропускаємо — технічне питання, не UX. `solution-architecture` тут стає головним driver-ом, бо саме архітектура виявляє де ризики.

### Сценарій 4 — Full agency waterfall _(paid discovery sprint, 3-5 тижнів)_

Класична agency engagement: клієнт оплатив повний discovery sprint, очікує proposal + SoW + roadmap. Це той сценарій, який покриває діаграма Discovery Phase.

```
profile-builder → problem-framing → stakeholder-mapping →
research-planning → user-interviews + sme-workshops +
competitive-scan + support-data-analysis + secondary-research →
insight-synthesis → personas → journey-mapping →
opportunity-mapping → risk-assumption-mapping →
feature-scoping → mvp-definition → solution-architecture →
feasibility-spike (if needed) → prototype-plan →
estimation → proposal + sow-draft + go-nogo-memo
```

→ Sequence C (paid direct) або D (paid mediated). Це найповніший прохід — продукує ~18-21 артефакт. Підходить для перших engagements з новим клієнтом, де треба довести зрілість процесу.

### Сценарій 5 — Lean validation _(Teresa Torres style, continuous)_

Команда вже знає продукт і користувачів, потрібно швидко валідувати opportunity без повного циклу. Артефакти мінімальні, цикл повторюваний.

```
problem-framing → user-interviews (3-5) →
insight-synthesis → opportunity-mapping →
risk-assumption-mapping → prototype-plan →
go-nogo-memo
```

Не використовується `personas` (вже існують і не змінились), `journey-mapping` (можливо), `solution-architecture` (рішення відоме). Цей сценарій — про швидке закриття одного opportunity, не про повний дискавері.

### Як обрати сценарій

| Питання | Відповідь | Сценарій |
|---|---|---|
| Це pre-sale? | Так | 1 |
| Це нова фіча для existing client? | Так | 2 |
| Питання чисто технічне? | Так | 3 |
| Це paid discovery sprint від A до Z? | Так | 4 |
| Команда сама себе обслуговує, потрібен швидкий цикл? | Так | 5 |

Conductor (`discovery-conductor`) автоматизує цей вибір: читає `discovery-context.md` → пропонує послідовність. BA може override на будь-якому кроці.

## Установка

### Рекомендований шлях: Claude Desktop або claude.ai (web)

Спроєктовано під нетехнічних користувачів (BA, PM, консультанти). Ні git, ні терміналу.

1. **Завантажте бандл.** Відкрийте [останній реліз][rel] і завантажте `discovery-phase-all.zip` (усі 25 скілів) — або візьміть окремі `<skill>.zip` файли, якщо потрібні лише деякі.
2. **Розпакуйте** `discovery-phase-all.zip`. Отримаєте папку `skills/` з 22 окремими `<skill>.zip` всередині. **Не розпаковуйте внутрішні файли** — claude.ai очікує кожен скіл як один zip.
3. **Відкрийте Claude → Settings → Capabilities → Skills → Upload skill.** Шлях однаковий у Claude Desktop і claude.ai web.
4. **Завантажте `profile-builder.zip` першим** — це foundation, який читають усі інші. Потім завантажте інші скіли, що вам потрібні.

> Підказка: кожен скіл перевіряє `discovery-context.md` у вашому проєкті і не блокує, якщо файл відсутній (запропонує bootstrap inline або `[ASSUMED]` теги). Найкращі результати — коли `profile-builder` запущено першим у новому проєкті.

[rel]: https://github.com/stanislavnianko/product-discovery-claude-skills/releases/latest

### Просунутий шлях: Claude Code `/plugin` (CLI / IDE)

```
/plugin marketplace add https://github.com/stanislavnianko/product-discovery-claude-skills
/plugin install discovery-phase@claude-skills
```

Суфікс `@claude-skills` — це назва маркетплейсу з `.claude-plugin/marketplace.json`; без нього Claude Code не знайде плагін. Скіли з'являються з namespace: `discovery-phase:profile-builder` і т.д.

### Просунутий шлях: filesystem install (CI / fallback)

```bash
git clone https://github.com/stanislavnianko/product-discovery-claude-skills.git
cd product-discovery-claude-skills
./install.sh                            # усі 25 скілів → ~/.claude/skills/
./install.sh --group foundation         # лише foundation скіли
./install.sh --project ~/myclient       # установити в скоуп проєкту
./install.sh --force                    # перезаписати наявні (re-install)
./install.sh --link --force             # dev-режим: symlink, перезапис
./install.sh --dry-run                  # перегляд без запису
```

`./install.sh` без `--force` пропускає папки, що вже існують — передайте `--force` для перезапису при re-install.

## Як користуватись паком

**1. Спочатку побудуйте контекст.**

```
Use the profile-builder skill.
```

Скіл інтерв'ює вас про клієнта, проєкт, доступ, очікуваний deliverable. Записує `discovery-context.md` у root вашого поточного проєкту. Це той самий файл, який потрібен усім іншим скілам.

**2. Запускайте скіли à la carte або через conductor.**

À la carte:
```
Use the problem-framing skill.
Use the stakeholder-mapping skill.
Use the user-interviews skill.
... і т.д.
```

З провідником:
```
Use the discovery-conductor skill.
```

Conductor читає ваш контекст, обирає послідовність на основі типу проєкту і рівня доступу, і веде вас по ній — але ви можете перевизначити будь-який крок. Усі 8 рекомендованих послідовностей (A–H) зберігаються у [`plugins/discovery-phase/skills/discovery-conductor/sequences.md`](plugins/discovery-phase/skills/discovery-conductor/sequences.md).

**3. Кожен скіл продукує артефакт у `./discovery/`.**

Вихід циклу discovery виглядає так:

```
./
├── discovery-context.md         (від profile-builder, foundation)
└── discovery/
    ├── _log.md                  (запущений лог runs скілів)
    ├── problem-canvas.md
    ├── stakeholder-map.md
    ├── research-plan.md
    ├── interview-guide.md
    ├── interview-notes/
    ├── sme-notes/
    ├── competitive-scan.md
    ├── secondary-research.md
    ├── support-data-analysis.md
    ├── insight-matrix.md
    ├── themes.md
    ├── personas.md
    ├── journey-map.md
    ├── opportunity-tree.md
    ├── risk-assumption-map.md
    ├── scope-doc.md
    ├── mvp-definition.md
    ├── solution-architecture.md
    ├── estimation.md
    ├── tech-spike-report.md
    ├── poc-plan.md
    ├── poc/                     (runnable skeleton, якщо застосовно)
    ├── proposal.md
    ├── sow-draft.md
    ├── discovery-handoff.md
    └── go-no-go-memo.md
```

Більшість проєктів запускають підмножину — типове pre-sale продукує ~10 файлів; повний оплачений discovery sprint — ~18-21.

## `_log.md` — єдина схема логу

Кожен downstream-скіл після запису артефакту дописує один рядок у `./discovery/_log.md` за єдиною канонічною схемою:

```
[<skill-name> | YYYY-MM-DD] key1: value1; key2: value2; key3: value3
```

Правила:
- У дужках — ім'я скіла та дата запуску (ISO формат, без часу).
- Тіло — плоский список пар `key: value` через `;`.
- Ключі специфічні для скіла, але мають бути короткими, lowercase, стабільними між запусками.
- Один рядок per run. Кілька запусків того самого скіла — кілька рядків (новіші внизу).

Ця схема дозволяє conductor читати `_log.md` для розуміння, що вже запущено, а deliverable-скілам (`proposal`, `sow-draft`, `discovery-handoff`, `go-nogo-memo`) — відновити evidence chain без перечитування кожного артефакту.

## Структура репозиторію

```
product-discovery-claude-skills/
├── .claude-plugin/marketplace.json   Маніфест маркетплейсу (1 плагін)
├── README.md                         (цей файл)
├── LICENSE                           MIT
├── install.sh                        Fallback filesystem інсталятор
├── scripts/
│   ├── build-release.sh              Пакує per-skill ZIP-и + бандл
│   └── validate-skills.sh            Лінт SKILL.md frontmatter (включно з полем pack)
└── plugins/
    └── discovery-phase/              Плагін
        ├── .claude-plugin/plugin.json
        └── skills/                   25 скілів, по одній папці на скіл
            ├── profile-builder/
            ├── discovery-conductor/  (+ sequences.md)
            ├── problem-framing/
            ├── stakeholder-mapping/
            ├── research-planning/
            ├── user-interviews/
            ├── sme-workshops/
            ├── competitive-scan/
            ├── secondary-research/
            ├── support-data-analysis/
            ├── insight-synthesis/
            ├── personas/
            ├── journey-mapping/
            ├── opportunity-mapping/
            ├── risk-assumption-mapping/
            ├── feature-scoping/
            ├── mvp-definition/
            ├── solution-architecture/
            ├── estimation/
            ├── feasibility-spike/
            ├── prototype-plan/
            ├── proposal/
            ├── sow-draft/
            ├── discovery-handoff/
            └── go-nogo-memo/
```

Кожна папка скіла містить `SKILL.md` (frontmatter + процедура) і `template.md` (шаблон артефакту).

## Frontmatter скіла

Кожен SKILL.md має такий блок frontmatter:

```yaml
---
name: <skill-name>
pack: discovery-phase            # обов'язково — ідентифікує приналежність до паку
description: >-                  # починається з [discovery-phase pack · <group>]
  [discovery-phase pack · <group>] <опис скіла>
group: <foundation|discovery|evidence|synthesis|scoping|validation|deliverables>
produces: <artifact filename>    # для downstream-скілів
consumes: <artifact list>        # для downstream-скілів
origin: ECC
---
```

Маркувальники приналежності до паку (для випадків, коли скіл встановлено окремо без плагіну):

1. **Frontmatter `pack: discovery-phase`** — machine-readable, для tooling/валідатора.
2. **Префікс у `description`** — `[discovery-phase pack · <group>]` — видно у claude.ai web UI.
3. **Body banner** — рядок `> Part of the **discovery-phase** skill pack · <group> group · …` одразу після `# Title`.

## Валідація

```bash
./scripts/validate-skills.sh
```

Перевіряє, що кожен SKILL.md має валідний frontmatter з `name` + `pack: discovery-phase` + `description`, плюс `group`/`produces` для не-foundation скілів, і body banner з посиланням на пак.

## Версіонування

**v1.2.0** — додано 3 скіли: `personas`, `journey-mapping`, `solution-architecture`. README отримав секцію "Сценарії використання" (5 типових кейсів). Conductor sequences A-H оновлені — нові скіли вписані в правильні точки кожної послідовності.

**v1.1.0** — pack-identity маркери (поле `pack`, префікс description, body banner) + структурне спрощення (стиснутий soft-gate, єдина схема `_log.md`, sequences винесено з conductor).

**v1.0.0** — перший стабільний реліз. 22 скіли, foundation-патерн, group-based, outsourcing-first framing.

Pre-1.0 історія (12-фазний orchestrator-патерн) була стерта при v1.0 релізі. Якщо потрібна — див. git tag `v0.1.0`.

## Ліцензія

MIT — див. [LICENSE](LICENSE).
