# VB6 Form Binary Files (.frx) Documentation

## What Are .frx Files?

In VB6, each `.frm` file has a companion `.frx` file that stores **binary data** referenced by the form's controls.

### Why Binary Data?

VB6 controls can contain binary resources that cannot be stored in text format:
- **Icons** for forms and controls
- **Images** in Picture controls
- **ImageList** collections (icons for toolbars, treeviews, etc.)
- **Cursor** definitions
- **Bitmap** resources embedded in controls

---

## What the .frx Contains

Based on this project's forms, here's what's stored:

```mermaid
graph TD
    subgraph FRX_CONTENT[Contents of .frx Files]
        I[Form Icons<br/>Line 10: Icon = "form.frx":0000]
        IM[ImageList Pictures<br/>Image1, Image2, etc.]
        P[Picture Controls<br/>Embedded bitmaps]
        O[Other Binary<br/>Mouse cursors, etc.]
    end
    
    I --> FRX[.frx Binary File]
    IM --> FRX
    P --> FRX
    O --> FRX
    
    FRX --> REF[Referenced by .frm]
    REF --> CTRL[Controls: Image, ImageList, Icon, Picture]
```

### Example from frm_generic_msgbox.frm:

```vb
' Line 10: Form icon stored in .frx at offset 0x0000
Icon = "ancora_goh_traditional_frm_generic_msgbox.frx":0000

' Lines 52, 56, 60, 64: ImageList pictures at various offsets
BeginProperty ListImage1
   Picture = "ancora_goh_traditional_frm_generic_msgbox.frx":0CCA
EndProperty
```

---

## How They Work

### File Relationship

| File | Type | Contains |
|------|------|----------|
| `.frm` | Text | Form layout, control properties, references to .frx |
| `.frx` | Binary | Raw binary data (images, icons) |

### The Offset System

VB6 stores binary data at specific offsets in .frx:

```
Form Icon:      Offset 0x0000  (":0000")
Image 1:        Offset 0x0CCA  (":0CCA")
Image 2:        Offset 0x111C  (":111C")
Image 3:        Offset 0x156E  (":156E")
Image 4:        Offset 0x19C0  (":19C0")
```

---

## Auto-Generation

### When Are They Created?

`.frx` files are **automatically generated** by the VB6 IDE when:

1. You set a form's `Icon` property
2. You add images to an `ImageList` control
3. You add a `Picture` to an `Image` control
4. You import any binary resource to a form

### When Are They Deleted?

- **Automatically** by VB6 when you remove all binary data from a form
- **Manually** should be avoided (will cause errors)

---

## Common Errors

### Error 1: Missing .frx

```
Can't load form: form.frm
File not found: form.frx
```

**Solution**: The .frx was deleted. If you have no binary data, create an empty file or restore from backup.

### Error 2: Corrupted .frx

```
Unexpected error loading form
```

**Solution**: Delete the .frx (if form has no binary data) or restore from backup.

### Error 3: Offset Mismatch

```
Invalid picture reference in form
```

**Solution**: The .frm references an offset that doesn't exist in .frx. Delete .frx, reload form in IDE.

---

## Best Practices

### 1. Keep Them Together

```
frm/
├── frmDatosActividad.frm   ← Text (version control)
├── frmDatosActividad.frx   ← Binary (DON'T edit manually)
├── frmDatosActividad.ctx   ← Binary (user control binary)
```

### 2. Version Control

| Approach | Pros | Cons |
|----------|------|------|
| Store both .frm and .frx | Full restore | Large binary diffs |
| Store only .frm | Clean diffs | Must re-add images |
| Use external resources | Cleanest | More setup required |

### 3. Regenerating .frx

If you lose a .frx but have the .frm:
1. Open the .frm in VB6 IDE
2. VB6 will show errors about missing binary data
3. Re-add the images/icons
4. Save the form
5. .frx will be regenerated

---

## In This Project

### .frx File Sizes (sample)

| Form | Size | Likely Contents |
|------|-------|------------------|
| frm_generic_msgbox.frx | ~5KB | Icons, ImageList |
| frm_generic_inputbox.frx | ~2KB | Simple icon |
| frm_generic_listview.frx | ~4KB | ImageList |
| frmDatosActividad.frx | ~5KB | Icons |
| frmKernelMain.frx | ~12KB | Toolbar icons |

### Forms Without .frx

If a form has no binary data, it doesn't need a .frx file.

---

## Summary

| Question | Answer |
|----------|--------|
| **What are they?** | Binary data storage for form controls |
| **Auto-generated?** | Yes, by VB6 IDE |
| **Can be deleted?** | Only if form has no binary data |
| **Version control?** | Store them to preserve all resources |
| **Regenerate possible?** | Yes, by re-adding images in IDE |

---

## Migration to Modern Systems

When converting to .NET/WPF/Web:

1. **Extract binary data**: Use tools to convert .frx images to PNG/JPG
2. **Store externally**: Move images to resources folder
3. **Update references**: Point controls to new resource locations
4. **Consider sprites**: Combine small icons into sprite sheets

---

*Document Status: 🟢 Complete*
