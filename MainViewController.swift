import UIKit
import NetworkExtension

class MainViewController: UIViewController {
    let startButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        startButton.setTitle("START 2026 REGEDIT", for: .normal)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        startButton.setTitleColor(.cyan, for: .normal)
        startButton.layer.borderColor = UIColor.cyan.cgColor
        startButton.layer.borderWidth = 2
        startButton.frame = CGRect(x: 0, y: 0, width: 320, height: 70)
        startButton.center = view.center
        startButton.addTarget(self, action: #selector(toggleEngine), for: .touchUpInside)
        view.addSubview(startButton)
    }

    @objc func toggleEngine() {
        NETunnelProviderManager.loadAllFromPreferences { managers, _ in
            let manager = managers?.first ?? NETunnelProviderManager()
            let config = NETunnelProviderProtocol()
            config.providerBundleIdentifier = "com.yourname.FF-Engine.Extension"
            config.serverAddress = "Regedit-2026"
            manager.protocolConfiguration = config
            manager.isEnabled = true
            manager.saveToPreferences { _ in
                try? manager.connection.startVPNTunnel()
                self.startButton.setTitle("ENGINE ACTIVE", for: .normal)
                self.startButton.setTitleColor(.red, for: .normal)
            }
        }
    }
}
