import sys
import os

# IMPORT MODULES
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


# INSTACE CLASS
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    # CHECK EXIT APP
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
