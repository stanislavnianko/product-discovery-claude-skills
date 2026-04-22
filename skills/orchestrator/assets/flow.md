# Discovery-to-PoC flow

```mermaid
flowchart TD
    A[Intake: problem, users, PoC?] --> B[1. Problem framing]
    B --> C[2. Stakeholder alignment]
    C --> D[3. User research planning]
    C --> E[5. Market competitive scan]
    D --> F[4. User interviews]
    F --> G[6. Insight synthesis]
    E --> G
    G --> H[7. Opportunity solution tree]
    H --> I[8. Risk assumption mapping]
    I --> J[9. Scope MVP definition]
    J -->|core track| M[12. Go/No-Go decision]
    J -->|tech-poc track| K[10. Tech feasibility spike]
    K --> L[11. PoC prototype plan + skeleton]
    L --> M
    M --> N{Decision}
    N -->|GO| O[Hand off to delivery]
    N -->|PIVOT| P[Restart with new hypothesis]
    N -->|KILL| Q[Archive memo, move on]
```

## Parallelism

- Phases **3** and **5** can run in parallel after phase 2.
- Phase **6** needs both 4 and 5 complete.
- Phases 10–11 are skippable via the `--core` track.

## Gating severity

- **Hard gates** (require user confirmation): end of phases 3, 4, 9, 11.
- **Soft gates** (auto-proceed with summary): 1, 2, 5, 6, 7, 8, 10, 12.
