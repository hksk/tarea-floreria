import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()

    // Establecer dimensiones de ventana vertical como un móvil
    let windowWidth: CGFloat = 375
    let windowHeight: CGFloat = 812
    let screenWidth = NSScreen.main?.frame.width ?? 1440
    let screenHeight = NSScreen.main?.frame.height ?? 900

    // Centrar la ventana en la pantalla
    let x = (screenWidth - windowWidth) / 2
    let y = (screenHeight - windowHeight) / 2

    let mobileFrame = NSRect(x: x, y: y, width: windowWidth, height: windowHeight)

    self.contentViewController = flutterViewController
    self.setFrame(mobileFrame, display: true)

    // Configurar propiedades de la ventana
    self.styleMask = [.titled, .closable, .miniaturizable, .resizable]
    self.minSize = NSSize(width: 300, height: 600)
    self.title = "Florería Bella"

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
