import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.FormLayout {
    property alias cfg_icon: iconField.text
    property alias cfg_iconSize: iconSizeSpin.value
    property alias cfg_gameCardWidth: cardSpin.value
    property alias cfg_defaultCategory: defaultCat.text
    property alias cfg_showAppLabels: showLabels.checked
    property alias cfg_showGameTitles: showTitles.checked

    RowLayout {
        Kirigami.FormData.label: i18n("Panel icon:")
        QQC2.TextField { id: iconField; placeholderText: i18n("icon name") }
    }
    RowLayout {
        Kirigami.FormData.label: i18n("App icon size:")
        QQC2.SpinBox { id: iconSizeSpin; from: 32; to: 128; stepSize: 8 }
        QQC2.Label { text: i18n("px"); opacity: 0.6 }
    }
    RowLayout {
        Kirigami.FormData.label: i18n("Game card width:")
        QQC2.SpinBox { id: cardSpin; from: 100; to: 320; stepSize: 10 }
        QQC2.Label { text: i18n("px"); opacity: 0.6 }
    }
    RowLayout {
        Kirigami.FormData.label: i18n("Default category:")
        QQC2.TextField { id: defaultCat; placeholderText: i18n("e.g. Favorites, Games") }
    }
    QQC2.CheckBox { id: showLabels; Kirigami.FormData.label: i18n("Show:"); text: i18n("App name labels") }
    QQC2.CheckBox { id: showTitles; text: i18n("Game titles (always, not just on hover)") }

    property string cfg_gamesViewMode             // not user-edited here; persisted from the toolbar
}
