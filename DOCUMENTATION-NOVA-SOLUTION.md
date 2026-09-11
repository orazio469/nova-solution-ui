# NOVA SOLUTION — Documentation

## Ajouter une option ON/OFF

Dans une carte de catégorie, ajoute une ligne avec une case à cocher :

```html
<div class="row">
  <label class="check">
    <input type="checkbox" onchange="changed('Nom de l’option', this.checked)">
    <span class="box"></span>Nom de l’option
  </label>
</div>
```

## Ajouter un slider

```html
<div class="row">
  <label>Vitesse</label>
  <div class="control">
    <input type="range" min="0" max="100" value="50" oninput="setValue(this)">
    <span class="value">50%</span>
  </div>
</div>
```

Pour une valeur en degrés, utilise `oninput="setValue(this, '°')"`.

## Ajouter une catégorie

Copie ce bloc dans le conteneur `.grid` :

```html
<section class="card">
  <h2>Nom de la catégorie</h2>
  <div class="empty">
    <div><b>Catégorie prête</b><br>Ajoute tes contrôles ici.</div>
  </div>
</section>
```

Remplace ensuite `.empty` par les lignes de tes options. Les styles rouges, le glow et les contrôles existants seront réutilisés automatiquement.

## Modifier le lien externe

Dans `menu-jeu.html`, remplace `https://example.com` par ton URL dans le lien `External`.

## Personnaliser le nom et les couleurs

Le nom `NOVA SOLUTION` est présent dans le logo et l’écran de chargement. Les couleurs principales sont regroupées au début du CSS dans `:root`, notamment `--red` et `--red2`.
