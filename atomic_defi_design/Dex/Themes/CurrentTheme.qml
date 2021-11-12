pragma Singleton

import Dex.Graphics 1.0 as Dex
import "DefaultTheme.js" as DexDefaultTheme

ThemeData
{
    readonly property var defaultTheme: DexDefaultTheme.getHardcoded()

    signal themeChanged()

    function loadFromFilesystem(themeName)
    {
        console.info("Dex.Themes.CurrentTheme.loadFromFilesystem: loading %1...".arg(themeName))

        try
        {
            if (!DexFilesystem.exists(DexFilesystem.getThemeFolder(themeName))) throw `${themeName} does not exist in the filesystem.`;

            let themeData = atomic_qt_utilities.load_theme(themeName);
            loadColors(themeData);
            loadLogo(themeName);

            printCurrentValues();

            themeChanged();

            console.info("Dex.Themes.CurrentTheme.loadFromFilesystem: %1 is loaded".arg(themeName));
        }
        catch (error)
        {
            console.error(`${themeName} is broken: ${error}. Trying to load a default theme.`);
            if (!DexFilesystem.exists(DexFilesystem.getThemeFolder("Default - Light")))
            {
                console.error("Default themes have been moved... Why did you do that ? I need to load an hardcoded one now.")
                loadColors(defaultTheme);
                loadLogo();
                themeChanged();
            }
            else loadFromFilesystem("Default - Light");
        }
    }

    function loadColors(themeData)
    {
        accentColor                         = Dex.Color.argbStrFromRgbaStr(themeData.accentColor || defaultTheme.accentColor);
        foregroundColor                     = Dex.Color.argbStrFromRgbaStr(themeData.foregroundColor || defaultTheme.foregroundColor);
        backgroundColor                     = Dex.Color.argbStrFromRgbaStr(themeData.backgroundColor || defaultTheme.backgroundColor);
        backgroundColorDeep                 = Dex.Color.argbStrFromRgbaStr(themeData.backgroundColorDeep || defaultTheme.backgroundColorDeep);

        buttonColorDisabled                 = Dex.Color.argbStrFromRgbaStr(themeData.buttonColorDisabled || defaultTheme.buttonColorDisabled);
        buttonColorEnabled                  = Dex.Color.argbStrFromRgbaStr(themeData.buttonColorEnabled || defaultTheme.buttonColorEnabled);
        buttonColorHovered                  = Dex.Color.argbStrFromRgbaStr(themeData.buttonColorHovered || defaultTheme.buttonColorHovered);
        buttonColorPressed                  = Dex.Color.argbStrFromRgbaStr(themeData.buttonColorPressed || defaultTheme.buttonColorPressed);
        buttonTextDisabledColor             = Dex.Color.argbStrFromRgbaStr(themeData.buttonTextDisabledColor || defaultTheme.buttonTextDisabledColor);
        buttonTextEnabledColor              = Dex.Color.argbStrFromRgbaStr(themeData.buttonTextEnabledColor || defaultTheme.buttonTextEnabledColor);
        buttonTextHoveredColor              = Dex.Color.argbStrFromRgbaStr(themeData.buttonTextHoveredColor || defaultTheme.buttonTextHoveredColor);
        buttonTextPressedColor              = Dex.Color.argbStrFromRgbaStr(themeData.buttonTextPressedColor || defaultTheme.buttonTextPressedColor);

        gradientButtonStartColor            = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonStartColor || defaultTheme.gradientButtonStartColor);
        gradientButtonEndColor              = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonEndColor || defaultTheme.gradientButtonEndColor);
        gradientButtonDisabledStartColor    = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonDisabledStartColor || defaultTheme.gradientButtonDisabledStartColor);
        gradientButtonDisabledEndColor      = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonDisabledEndColor || defaultTheme.gradientButtonDisabledEndColor);
        gradientButtonHoveredStartColor     = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonHoveredStartColor || defaultTheme.gradientButtonHoveredStartColor);
        gradientButtonHoveredEndColor       = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonHoveredEndColor || defaultTheme.gradientButtonHoveredEndColor);
        gradientButtonPressedStartColor     = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonPressedStartColor || defaultTheme.gradientButtonPressedStartColor);
        gradientButtonPressedEndColor       = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonPressedEndColor || defaultTheme.gradientButtonPressedEndColor);
        gradientButtonTextEnabledColor      = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonTextEnabledColor || defaultTheme.gradientButtonTextEnabledColor);
        gradientButtonTextDisabledColor     = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonTextDisabledColor || defaultTheme.gradientButtonTextDisabledColor);
        gradientButtonTextHoveredColor      = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonTextHoveredColor || defaultTheme.gradientButtonTextHoveredColor);
        gradientButtonTextPressedColor      = Dex.Color.argbStrFromRgbaStr(themeData.gradientButtonTextPressedColor || defaultTheme.gradientButtonTextPressedColor);

        checkBoxGradientStartColor          = Dex.Color.argbStrFromRgbaStr(themeData.checkBoxGradientStartColor || defaultTheme.checkBoxGradientStartColor);
        checkBoxGradientEndColor            = Dex.Color.argbStrFromRgbaStr(themeData.checkBoxGradientEndColor || defaultTheme.checkBoxGradientEndColor);

        switchGradientStartColor            = Dex.Color.argbStrFromRgbaStr(themeData.switchGradientStartColor || defaultTheme.switchGradientStartColor);
        switchGradientEndColor              = Dex.Color.argbStrFromRgbaStr(themeData.switchGradientEndColor || defaultTheme.switchGradientEndColor);
        switchGradientStartColor2           = Dex.Color.argbStrFromRgbaStr(themeData.switchGradientStartColor2 || defaultTheme.switchGradientStartColor2);
        switchGradientEndColor2             = Dex.Color.argbStrFromRgbaStr(themeData.switchGradientEndColor2 || defaultTheme.switchGradientEndColor2);

        comboBoxBackgroundColor             = Dex.Color.argbStrFromRgbaStr(themeData.comboBoxBackgroundColor || defaultTheme.comboBoxBackgroundColor);
        comboBoxArrowsColor                 = Dex.Color.argbStrFromRgbaStr(themeData.comboBoxArrowsColor || defaultTheme.comboBoxArrowsColor);
        comboBoxDropdownItemHighlightedColor = Dex.Color.argbStrFromRgbaStr(themeData.comboBoxDropdownItemHighlightedColor || defaultTheme.comboBoxDropdownItemHighlightedColor);

        modalPageCounterGradientStartColor  = Dex.Color.argbStrFromRgbaStr(themeData.modalPageCounterGradientStartColor || defaultTheme.modalPageCounterGradientStartColor);
        modalPageCounterGradientEndColor    = Dex.Color.argbStrFromRgbaStr(themeData.modalPageCounterGradientEndColor || defaultTheme.modalPageCounterGradientEndColor);

        scrollBarIndicatorColor             = Dex.Color.argbStrFromRgbaStr(themeData.scrollBarIndicatorColor || defaultTheme.scrollBarIndicatorColor);
        scrollBarBackgroundColor            = Dex.Color.argbStrFromRgbaStr(themeData.scrollBarBackgroundColor || defaultTheme.scrollBarBackgroundColor);

        tabSelectedColor                    = Dex.Color.argbStrFromRgbaStr(themeData.tabSelectedColor || defaultTheme.tabSelectedColor);

        textDisabledColor                   = Dex.Color.argbStrFromRgbaStr(themeData.textDisabledColor || defaultTheme.textDisabledColor);
        textSelectionColor                  = Dex.Color.argbStrFromRgbaStr(themeData.textSelectionColor || defaultTheme.textSelectionColor);
        textPlaceholderColor                = Dex.Color.argbStrFromRgbaStr(themeData.textPlaceholderColor || defaultTheme.textPlaceholderColor);
        textSelectedColor                   = Dex.Color.argbStrFromRgbaStr(themeData.textSelectedColor || defaultTheme.textSelectedColor);

        chartTradingLineBackgroundColor     = Dex.Color.argbStrFromRgbaStr(themeData.chartTradingLineBackgroundColor || defaultTheme.chartTradingLineBackgroundColor);
        chartTradingLineColor               = Dex.Color.argbStrFromRgbaStr(themeData.chartTradingLineColor || defaultTheme.chartTradingLineColor);

        innerBackgroundColor                = Dex.Color.argbStrFromRgbaStr(themeData.innerBackgroundColor || defaultTheme.innerBackgroundColor);

        floatingBackgroundColor             = Dex.Color.argbStrFromRgbaStr(themeData.floatingBackgroundColor || defaultTheme.floatingBackgroundColor);

        sidebarBgColor                      = Dex.Color.argbStrFromRgbaStr(themeData.sidebarBgColor || defaultTheme.sidebarBgColor);
        sidebarVersionTextColor             = Dex.Color.argbStrFromRgbaStr(themeData.sidebarVersionTextColor || defaultTheme.sidebarVersionTextColor);
        sidebarCursorStartColor             = Dex.Color.argbStrFromRgbaStr(themeData.sidebarCursorStartColor || defaultTheme.sidebarCursorStartColor);
        sidebarCursorEndColor               = Dex.Color.argbStrFromRgbaStr(themeData.sidebarCursorEndColor || defaultTheme.sidebarCursorEndColor);
        sidebarLineTextHovered              = Dex.Color.argbStrFromRgbaStr(themeData.sidebarLineTextHovered || defaultTheme.sidebarLineTextHovered);

        okColor                             = Dex.Color.argbStrFromRgbaStr(themeData.okColor || defaultTheme.okColor);
        noColor                             = Dex.Color.argbStrFromRgbaStr(themeData.noColor || defaultTheme.noColor);

        arrowUpColor                        = Dex.Color.argbStrFromRgbaStr(themeData.arrowUpColor || defaultTheme.arrowUpColor);
        arrowDownColor                      = Dex.Color.argbStrFromRgbaStr(themeData.arrowDownColor || defaultTheme.arrowDownColor);

        lineSeparatorColor                  = Dex.Color.argbStrFromRgbaStr(themeData.lineSeparatorColor || defaultTheme.lineSeparatorColor);
    }

    function loadLogo(themeName)
    {
        let themePath   = DexFilesystem.getThemeFolder(themeName);
        let _logoPath    = `${themePath}/dex-logo.png`;
        let _bigLogoPath = `${themePath}/dex-logo-big.png`;

        logoPath    = DexFilesystem.exists(_logoPath) ? `file:///${_logoPath}` : "qrc:///assets/images/logo/dex-logo.png";
        bigLogoPath = DexFilesystem.exists(_bigLogoPath) ? `file:///${_bigLogoPath}` : "qrc:///assets/images/dex-logo-big.png";
    }

    // Prints current loaded theme values.
    function printCurrentValues()
    {
        console.info("Dex.Themes.CurrentTheme.printValues.accentColor : %1".arg(accentColor));
        console.info("Dex.Themes.CurrentTheme.printValues.foregroundColor : %1".arg(foregroundColor));
        console.info("Dex.Themes.CurrentTheme.printValues.backgroundColor : %1".arg(backgroundColor));
        console.info("Dex.Themes.CurrentTheme.printValues.backgroundColorDeep : %1".arg(backgroundColorDeep));

        console.info("Dex.Themes.CurrentTheme.printValues.buttonColorDisabled : %1".arg(buttonColorDisabled));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonColorEnabled : %1".arg(buttonColorEnabled));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonColorHovered : %1".arg(buttonColorHovered));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonColorPressed : %1".arg(buttonColorPressed));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonTextDisabledColor : %1".arg(buttonTextDisabledColor));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonTextEnabledColor : %1".arg(buttonTextEnabledColor));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonTextHoveredColor : %1".arg(buttonTextHoveredColor));
        console.info("Dex.Themes.CurrentTheme.printValues.buttonTextPressedColor : %1".arg(buttonTextPressedColor));

        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonStartColor : %1".arg(gradientButtonStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonEndColor : %1".arg(gradientButtonEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonDisabledStartColor : %1".arg(gradientButtonDisabledStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonDisabledEndColor : %1".arg(gradientButtonDisabledEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonHoveredStartColor : %1".arg(gradientButtonHoveredStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonHoveredEndColor : %1".arg(gradientButtonHoveredEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonPressedStartColor : %1".arg(gradientButtonPressedStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonPressedEndColor : %1".arg(gradientButtonPressedEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonTextEnabledColor : %1".arg(gradientButtonTextEnabledColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonTextDisabledColor : %1".arg(gradientButtonTextDisabledColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonTextHoveredColor : %1".arg(gradientButtonTextHoveredColor));
        console.info("Dex.Themes.CurrentTheme.printValues.gradientButtonTextPressedColor : %1".arg(gradientButtonTextPressedColor));

        console.info("Dex.Themes.CurrentTheme.printValues.checkBoxGradientStartColor : %1".arg(checkBoxGradientStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.checkBoxGradientEndColor : %1".arg(checkBoxGradientEndColor));

        console.info("Dex.Themes.CurrentTheme.printValues.switchGradientStartColor : %1".arg(switchGradientStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.switchGradientEndColor : %1".arg(switchGradientEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.switchGradientStartColor2 : %1".arg(switchGradientStartColor2));
        console.info("Dex.Themes.CurrentTheme.printValues.switchGradientEndColor2 : %1".arg(switchGradientEndColor2));

        console.info("Dex.Themes.CurrentTheme.printValues.comboBoxBackgroundColor : %1".arg(comboBoxBackgroundColor));
        console.info("Dex.Themes.CurrentTheme.printValues.comboBoxArrowsColor : %1".arg(comboBoxArrowsColor));
        console.info("Dex.Themes.CurrentTheme.printValues.comboBoxDropdownItemHighlightedColor : %1".arg(comboBoxDropdownItemHighlightedColor));

        console.info("Dex.Themes.CurrentTheme.printValues.modalPageCounterGradientStartColor : %1".arg(modalPageCounterGradientStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.modalPageCounterGradientEndColor : %1".arg(modalPageCounterGradientEndColor));

        console.info("Dex.Themes.CurrentTheme.printValues.scrollBarIndicatorColor : %1".arg(scrollBarIndicatorColor));
        console.info("Dex.Themes.CurrentTheme.printValues.scrollBarBackgroundColor : %1".arg(scrollBarBackgroundColor));

        console.info("Dex.Themes.CurrentTheme.printValues.tabSelectedColor : %1".arg(tabSelectedColor));

        console.info("Dex.Themes.CurrentTheme.printValues.textSelectionColor : %1".arg(textSelectionColor));
        console.info("Dex.Themes.CurrentTheme.printValues.textPlaceholderColor : %1".arg(textPlaceholderColor));
        console.info("Dex.Themes.CurrentTheme.printValues.textSelectedColor : %1".arg(textSelectedColor));

        console.info("Dex.Themes.CurrentTheme.printValues.chartTradingLineBackgroundColor : %1".arg(chartTradingLineBackgroundColor));
        console.info("Dex.Themes.CurrentTheme.printValues.chartTradingLineColor : %1".arg(chartTradingLineColor));

        console.info("Dex.Themes.CurrentTheme.printValues.innerBackgroundColor : %1".arg(innerBackgroundColor));

        console.info("Dex.Themes.CurrentTheme.printValues.floatingBackgroundColor : %1".arg(floatingBackgroundColor));

        console.info("Dex.Themes.CurrentTheme.printValues.sidebarBgColor : %1".arg(sidebarBgColor));
        console.info("Dex.Themes.CurrentTheme.printValues.sidebarVersionTextColor : %1".arg(sidebarVersionTextColor));
        console.info("Dex.Themes.CurrentTheme.printValues.sidebarCursorStartColor : %1".arg(sidebarCursorStartColor));
        console.info("Dex.Themes.CurrentTheme.printValues.sidebarCursorEndColor : %1".arg(sidebarCursorEndColor));
        console.info("Dex.Themes.CurrentTheme.printValues.sidebarLineTextHovered : %1".arg(sidebarLineTextHovered));

        console.info("Dex.Themes.CurrentTheme.printValues.okColor : %1".arg(okColor));
        console.info("Dex.Themes.CurrentTheme.printValues.noColor : %1".arg(noColor));

        console.info("Dex.Themes.CurrentTheme.printValues.arrowUpColor : %1".arg(arrowUpColor));
        console.info("Dex.Themes.CurrentTheme.printValues.arrowDownColor : %1".arg(arrowDownColor));

        console.info("Dex.Themes.CurrentTheme.printValues.lineSeparatorColor : %1".arg(lineSeparatorColor));

        console.info("Dex.Themes.CurrentTheme.printValues.logoPath : %1".arg(logoPath));
        console.info("Dex.Themes.CurrentTheme.printValues.bigLogoPath : %1".arg(bigLogoPath));
    }
}