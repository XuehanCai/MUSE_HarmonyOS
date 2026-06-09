
# 11_border属性

## 1. border 是什么

`border` 边框（text,Image,column)。

```ts
Text('VIP')
  .border({ width: 1, color: '#9A8E28', radius: 12 })
```

## 2. width

`width` 设置边框粗细。

```ts
Text('VIP')
  .border({ width: 1 })
```

## 3. color

`color` 设置边框颜色。

```ts
Text('VIP')
  .border({ color: '#9A8E28' })
```

## 4. radius

`radius` 设置圆角。

```ts
Text('VIP')
  .border({ radius: 12 })
```

## 5. 图片圆角

图片也可以用 `border` 设置圆角。

```ts
Image($r('app.media.shanghetu'))
  .width(80)
  .height(80)
  .border({ radius: 8 })
```

## 6. 记忆点

- `border` 设置边框
- `width` 是边框粗细
- `color` 是边框颜色
- `radius` 是圆角
- 文字、图片、容器都可以设置边框
