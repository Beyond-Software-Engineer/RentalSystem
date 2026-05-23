export function formatMoney(amount) {
  return `¥${Number(amount).toFixed(0)}`
}

export function formatDate(date, format = 'YYYY-MM-DD') {
  if (!date) return ''
  const d = new Date(date)
  const year = d.getFullYear()
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  const hour = String(d.getHours()).padStart(2, '0')
  const minute = String(d.getMinutes()).padStart(2, '0')
  const second = String(d.getSeconds()).padStart(2, '0')
  
  return format
    .replace('YYYY', year)
    .replace('MM', month)
    .replace('DD', day)
    .replace('HH', hour)
    .replace('mm', minute)
    .replace('ss', second)
}

export function formatRoomInfo(house) {
  const { room, hall, kitchen, toilet } = house
  return `${room}室${hall}厅${kitchen}厨${toilet}卫`
}

export function formatHouseType(type) {
  const typeMap = {
    1: '住宅',
    2: '公寓',
    3: '商铺'
  }
  return typeMap[type] || '未知'
}

export function formatDecorationType(type) {
  const typeMap = {
    1: '毛坯',
    2: '简装',
    3: '精装'
  }
  return typeMap[type] || '未知'
}

export function formatFloor(floor) {
  if (floor <= 0) return '低层'
  if (floor <= 6) return '多层'
  if (floor <= 11) return '小高层'
  if (floor <= 18) return '高层'
  return '超高层'
}
