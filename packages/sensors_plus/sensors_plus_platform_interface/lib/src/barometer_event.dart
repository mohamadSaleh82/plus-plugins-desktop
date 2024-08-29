/// A sensor sample from a barometer.
///
/// Barometers measure the atmospheric pressure surrounding the sensor,
/// returning values in hectopascals ***hPa***.
///
/// Consider that these samples may be affected by altitude and weather
/// conditions, and can be used to predict short-term weather changes or
/// determine altitude.
///
/// Note that water-resistant phones or similar sealed devices may experience
/// pressure fluctuations as the device is held or used, due to changes in
/// pressure caused by handling the device.
///
/// An altimeter is an example of a general utility for barometer data.
class BarometerEvent {
  /// Constructs a new instance with the given [pressure] value.
  ///
  /// See [BarometerEvent] for more information.
  BarometerEvent(this.pressure, this.timestamp);

  /// The atmospheric pressure surrounding the sensor in hectopascals ***hPa***.
  final double pressure;

  /// timestamp of the event
  ///
  /// This is the timestamp of the event in microseconds, as provided by the
  /// underlying platform. For Android, this is the uptimeMillis provided by
  /// the SensorEvent. For iOS, this is the timestamp provided by the CMDeviceMotion.

  final DateTime timestamp;

  @override
  String toString() =>
      '[BarometerEvent (pressure: $pressure hPa, timestamp: $timestamp)]';
}
