export default function isset (accessor) {
    try {
        return typeof accessor() !== 'undefined'
    }
    catch (e) {
        return false
    }
}
