
let map = null;

const image = {
  height: 467,
  width: 477,
  imageUrl: './map.png',
}

const grid = {
  size: 40,
  height: ()=>image.height/grid.size,
  width:  ()=>image.width /grid.size,
}

const validate = (point) => {
  const validPoint = {...point}
  if (point.height < 0) {validPoint.height = 0}
  if (point.width < 0) {validPoint.width = 0}
  if (point.height > image.height-1) {validPoint.height = image.height-1}
  if (point.width > image.width-1) {validPoint.width = image.width-1}
  validPoint.height = Math.floor(Math.floor(validPoint.height / grid.height())*grid.height())
  validPoint.width = Math.floor(Math.floor(validPoint.width / grid.width())*grid.width())
  return validPoint
}

const toGrid = (latlng) => {
  return {
    height: Math.round(image.height - latlng.lat),
    width: Math.round(latlng.lng),
  }
}

const toCenter = (point) => {
  return {
    height: Math.floor(point.height + grid.height()/2),
    width: Math.floor(point.width + grid.width()/2),
  }
}

const toMap = (point) => {
  return {
    lat: (image.height - point.height)-grid.height()/2,
    lng: point.width+grid.width()/2,
  }
}

let isObstacle = (point) =>  true
let removeImage = () => {}
const setImage = () => {
  removeImage()
  map.setMaxBounds(new L.LatLngBounds([[0,image.width+image.width*0.2], [image.height+image.height*0.2,0]]))
  const data = L.imageOverlay(image.imageUrl, [[0,image.width], [image.height,0]]).addTo(map)
  const canvas = document.createElement('canvas')
  canvas.width = image.width
  canvas.height = image.height
  isObstacle = (point) => {
    canvas.getContext('2d').drawImage(data._image, 0, 0)
    const imagePoint = canvas.getContext('2d').getImageData(point.width, point.height, 1, 1).data
    return !(imagePoint[0]||imagePoint[1]||imagePoint[2])
  }
  removeImage = canvas.remove
}

document.addEventListener("DOMContentLoaded", ()=>{
  const popup = L.popup()
  const selected = L.rectangle([[0,0],[0,0]], {color: '#ffff0055', weight: 2, fillColor:'#000000bb'})
  map = L.map('map', {
    crs: L.CRS.Simple,
    attributionControl: false,
    minZoom:0,
  }).setView([0, 0], 0)
  setImage()

  map.on('click', (e)=>{
    const clicked = validate(toGrid(e.latlng))
    popup.setLatLng(toMap(clicked)).setContent(`
      <div>
        <p>height: ${clicked.height}, width: ${clicked.width} is a ${isObstacle(toCenter(clicked))?'obstacle':'valid point'}</p>
        ${document.getElementById('popup-content').outerHTML}
      </div>
    `).openOn(map)
  })
  map.on('mousemove', (e)=>{
    const start = validate ({
      height: image.height - Math.round(image.height - e.latlng.lat),
      width: Math.round(e.latlng.lng),
    })
    const end = {
      height: start.height + grid.height(),
      width: start.width + grid.width(),
    }
    selected.setBounds([[start.height, start.width], [end.height, end.width]])
    selected.addTo(map)
  })
})


