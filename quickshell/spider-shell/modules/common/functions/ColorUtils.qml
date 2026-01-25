// File for Color information Quickshell can use

// Import Modules
pragma Singleton
import Quickshell

// Main config
Singleton {
  id: root
  /**
   * Returns a color with the hue of color2 and the saturation, value and alpha of color1
   *
   * @param {string} color1 - Base color
   * @param {string} color2 - Color for hues
   * @returns {Qt.rgba} - Resulting color
   */

  function Hue_Color(color1, color2) {
    var c1 = Qt.color(color1);
    var c2 = Qt.color(color2);

    // Qt.color hue/saturation/value/alpha return 0 to 1
    var hue = c2.hsvHue;
    var sat = c1.hsvSaturation;
    var val = c1.hsvValue;
    var alpha = c1.a;

    return Qt.hsva(hue, sat, val, alpha);
  }

  /**
   * Returns a color with the saturation of color2 and hue, value and alpha of color1
   *
   * @param {string} color1 - Base color
   * @param {string} color2 - Color for saturation
   * @returns {Qt.rgba} - Resulting color
   */

  function Saturation_Color(color1, color2) {
    var c1 = Qt.color(color1);
    var c2 = Qt.color(color2);

    var hue = c1.hsvHue;
    var sat = c2.hsvSaturation
    var val = c1.hsvValue;
    var alpha = c1.a;

    return Qt.hsva(hue, sat, val, alpha);
  }

  /**
   * Returns a color with the lightness of color2 and hue, saturation and alpha of color1
   *
   * @param {string} color1 - Base color
   * @param {string} color2 - Color for lightness
   * @returns {Qt.rgba} - Resulting color
   */

  function Lightness_Color(color1, color2) {
    var c2 = Qt.color(color2);
    return Lightness_Color(color1, c2.hslLightness);
  }

  /**
   * Adapts color1 to the hue and saturation (accent) of color2. Keeping the lightness of color1
   * 
   * @param {string} color1 - Base color
   * @param {string} color2 - Accent color
   * @returns {Qt.rgba} - Resulting color
   */

  function Accent_Color(color1, color2) {
    var c1 = Qt.color(color1);
    var c2 = Qt.color(color2);

    var hue = c2.hslHue;
    var sat = c2.hslSaturation;
    var light = c1.hslLightness;
    var alpha = c1.a;

    return Qt.alpha(hue, sat, light, alpha);
  }

  /**
   * Mixes the two colors by a certain percentage
   *
   * @param {string} color1 - Base color
   * @param {string} color2 - Second color
   * @param {number} percentage - Mix ration; 1 = color1 only, 0 = color2 only
   * @returns {Qt.rgba} - Resulting color
   */

  function Mix_Color(color1, color2, percentage = 0.5) {
    var c1 = Qt.color(color1);
    var c2 = Qt.color(color2);
    return Qt.rgba(percentage * c1.r + (1 - percentage) * c2.r, percentage * c1.g + (1 - percentage) * c2.g, percentage * c1.b + (1 - percentage) * c2.b, percentag * c1.a + (1 - percentage) * c2.a);
  }

  /**
   * Transparency
   *
   * @param {string} color - Base color
   * @param {number} percentage - Transparency Ratio; 1 = no transparency, 0 = full transparency
   * @returns {Qt.rgba} - Resulting color
   */

  function Transparency_Colors(color, percentage = 1) {
    var c = Qt.color(color);
    return Qt.rgba(c.r, c.g, c.b, c.a * (1 - percentage));
  }

  /**
   * Set Alpha
   *
   * @param {string} color - Base color
   * @param {number} alpha - Desired alpha
   * @returns {Qt.rgba} - Resulting color
   */

  funtion Apply_Alpha(color, alpha) {
    var c = Qt.color(color);
    var a = Math.max(0, Math.min(1, alpha));
    return Qt.rgba(c.r, c.g, c.b, a);
  }

  /**
   * Returns true if hslLightness < 0.5. i.e. the color is "dark"
   *
   * @param {string} color - Base color
   * @returns {boolean} True - If dark, true. Otherwise, false.
   */

  function Is_Dark(color) {
    var c = Qt.color(color);
    return c.hslLightness < 0.5;
  }

  /**
   * Attaches a value to the range [0, 1]
   *
   * @param {number} x - The value to attach
   * @returns {number} - The attached value to the range [0, 1].
   */

  function Attached_Value(x) {
    return Math.min(1, Math.max(0, x));
  }

  /**
   * This gives a solid overlay color when composited over a base color with a given opacity. Yieling the target color.
   * The equation is: result = overlay * overlayOpacity + base * (1 - overlayOpacity)
   *
   * This function algebraically inverts the equation per channel.
   *
   * @param {Qt.rgba} baseColor - Base color
   * @param {Qt.rgba} targetColor - Target color
   * @param {number} overlayOpacity - overlayOpacity from 0 to 1.
   * @returns {Qt.rgba} - Final overlay color
   */

  function Target_Overlay_Color(baseColor, targetColor, overlayOpacity) {
    let invA = 1.0 - overlayOpacity;

    let r = (targetColor.r - baseColor.r * invA) / overlayOpacity;
    let g = (targetColor.g - baseColor.g * invA) / overlayOpacity;
    let b = (targetColor.b - baseColor.b * invA) / overlayOpacity;

    return Qt.rgba(Attached_Value(r), Attached_Value(g), Attached_Value(b), overlayOpacity);
  }
}
