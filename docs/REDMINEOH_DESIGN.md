# RedmineOH Visual Design Contract

## 1. Design objective

RedmineOH should feel like a polished native macOS productivity application translated to the web. The interface should feel calm, precise, efficient, and immediately legible to users who are familiar with modern macOS software.

That inspiration must remain directional, not imitative. RedmineOH must be an original product design and must not reproduce Apple interfaces, layouts, branding, or behaviors exactly.

## 2. Design principles

### Content first

The interface should support work before decoration. Visual treatment must improve clarity, focus, and task completion rather than compete with content.

### Quiet surfaces

Surfaces should feel calm and restrained. Backgrounds, borders, and fills should support readability without becoming the primary visual event.

### Clear hierarchy

Importance must be visible at a glance through spacing, typography, contrast, and containment. Primary actions and primary content should always be easy to identify.

### Familiar interactions

Controls and patterns should feel recognizable to users of desktop productivity software. Familiarity should come from behavior and clarity, not imitation.

### Controlled density

RedmineOH should support information-rich workflows without feeling cramped. Density should be deliberate and adjustable through layout choices, not achieved by shrinking everything indiscriminately.

### Precise alignment

Alignment, spacing, and rhythm should be consistent across navigation, forms, tables, panels, and dialogs. Small inconsistencies will be more visible in a restrained design system.

### Subtle depth

Depth should help users understand layers, grouping, and interaction state. Use depth sparingly and with intention.

### Accessibility

Contrast, focus visibility, readable target sizes, keyboard access, and reduced-motion support are mandatory parts of the design language, not optional polish.

### Progressive enhancement

The interface must remain functional and understandable without advanced visual effects or JavaScript-dependent embellishments.

### Consistency before novelty

Shared patterns should be reused before new variants are introduced. Originality should come from disciplined system design rather than constant invention.

## 3. Visual characteristics

RedmineOH should adopt the following visual characteristics:

- Apple-platform system font stack.
- Cool neutral page background.
- Layered white or near-white surfaces.
- Fine neutral borders.
- Soft shadows.
- Restrained corner radii.
- Apple-adjacent blue interaction color.
- Compact toolbars.
- Spacious primary content.
- Sidebar-oriented navigation.
- Short and subtle transitions.
- Selective translucency.

Together these choices should create a familiar macOS-adjacent atmosphere while preserving a distinctly RedmineOH identity.

## 4. Surface hierarchy

RedmineOH should use a clear surface hierarchy instead of treating every region as an isolated card.

### Canvas

The canvas is the app-level background behind all major content regions. It should be cool, neutral, and visually quiet.

### Sidebar

The sidebar is a persistent navigational surface. It may use selective translucency or subtle tonal separation to distinguish navigation from the main work area.

### Primary content surface

The primary content surface is the main reading and editing plane. It should usually feel stable, broad, and more spacious than surrounding utility regions.

### Grouped surface

Grouped surfaces are used for related controls, settings, metadata, or content subsections. They should be visibly subordinate to the main content plane and may use inset treatment or mild containment.

### Elevated popover or dialog

Elevated surfaces communicate temporary focus, interruption, or contextual tools. These surfaces may use stronger shadows, stronger separation, and selective translucency where appropriate.

### Selected or active surface

Selected or active surfaces communicate current context, focus, or state. This emphasis should rely on tint, border treatment, or restrained fill changes rather than heavy decoration.

Not every section should become a floating card. Over-fragmenting the interface reduces hierarchy, increases noise, and weakens the macOS-inspired sense of disciplined structure.

## 5. Typography hierarchy

Typography should rely on a small, reusable scale rather than many arbitrary sizes. Differences in role should come from a combination of size, weight, spacing, and color.

### Page title

Used for the main identity of a page or view. It should be the strongest text role, with moderate emphasis rather than oversized display styling.

### Section title

Used to divide major areas of content. It should be clearly subordinate to the page title while remaining easy to scan.

### Body text

Used for the main reading experience in descriptions, settings, and explanatory UI. It should prioritize legibility and stable rhythm.

### Secondary text

Used for supporting explanation, empty states, helper text, and less prominent details. It should remain readable while carrying lower visual weight than body text.

### Labels

Used for controls, form fields, and compact headings. Labels should be concise, consistent, and slightly emphasized for scanability.

### Table text

Used in dense information views such as issue lists and administrative tables. It should remain compact without appearing cramped.

### Metadata

Used for timestamps, authorship, status context, and other supporting details. It should be visually quieter than body text but never so faint that it disappears.

### Monospace content

Used for code, identifiers, revision references, and machine-oriented values. It should align with the overall typography system rather than feeling imported from a different interface.

The reusable type scale should be small, predictable, and shared across modules so pages feel related even when their content differs.

## 6. Shape language

Shape treatment should be disciplined and reusable.

- Standard control radius should be modest and consistent across buttons, inputs, menus, and segmented controls.
- Larger container radius may be used for primary surfaces, grouped sections, and dialogs when it reinforces structure.
- Pill shape should be reserved for tags, status badges, and compact filters.
- Borders should remain thin and precise.
- Excessive card nesting should be avoided.

Rounded geometry should support clarity and softness without making the interface toy-like or overly decorative.

## 7. Interaction language

Interactive components should define and preserve clear state changes across the system.

### Default

Default state should feel calm, readable, and unambiguous.

### Hover

Hover should provide light feedback that improves discoverability without causing large visual jumps.

### Focus-visible

Keyboard focus must remain clearly visible. Focus styling should be intentional, high-confidence, and consistently applied across all controls.

### Active

Active state should communicate press or engagement with tight, momentary feedback.

### Selected

Selected state should be clearly distinct from hover and active states, usually through restrained tinting, border emphasis, or background treatment.

### Disabled

Disabled state should be visibly inactive while preserving legibility and avoiding misleading contrast cues.

### Destructive

Destructive actions should be unmistakable, but still consistent with the restrained overall system.

## 8. Motion

Motion should support comprehension, not decorate the interface.

- Use short transitions.
- No decorative animation.
- Respect `prefers-reduced-motion`.
- No animation should be required for essential comprehension.

When motion is present, it should reinforce layering, state changes, and continuity in a subtle way.

## 9. macOS-inspired elements that are allowed

The following macOS-inspired directions are allowed:

- System typography.
- Sidebar-style navigation.
- Translucent elevated navigation.
- Segmented-control styling.
- Subtle inset grouped surfaces.
- Native-feeling menus and dialogs.
- Restrained blue selection states.
- Careful visual density.

These elements may inform the design language as long as they are adapted into an original RedmineOH system.

## 10. Elements that are prohibited

The following are prohibited:

- Apple logos.
- Apple trademarks used as RedmineOH branding.
- Copied Apple application layouts.
- Copied SF Symbols or proprietary assets.
- Fake window traffic-light controls.
- Exact macOS screenshots recreated as UI.
- Heavy glass effects across all content.
- Excessive blur.
- Excessive gradients.
- Excessive rounded cards.
- Decorative animation.
- Making controls ambiguous for visual similarity.

The goal is recognizable influence without imitation, confusion, or legal risk.

## 11. Implementation boundaries

- Visual work belongs in `themes/redmine_oh/`.
- Redmine core must not be edited for theme work.
- Existing third-party themes may be inspected for selector coverage but not copied.
- No dependency should be introduced for basic theme styling.
- Theme JavaScript must remain optional and progressively enhance existing behavior.

These boundaries should guide all future RedmineOH visual implementation tasks.

## 12. Initial priority order

1. Design tokens
2. Typography and base canvas
3. Global header and project navigation
4. Sidebar and content layout
5. Shared controls
6. Issue list
7. Issue detail
8. Issue forms
9. Supporting modules
10. Responsive behavior
11. Dark mode
12. Final accessibility polish

## Out of scope

The following are out of scope for this design contract:

- CSS implementation.
- JavaScript.
- Theme assets.
- Plugin research.
- Repository cleanup.
- README rewrite.
- Tests.
