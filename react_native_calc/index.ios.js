/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  ScrollView,
  SegmentedControlIOS,
  SliderIOS,
  StyleSheet,
  Text,
  TextInput,
} = React;

var react_native_calc = React.createClass({
  getInitialState() {
    return {
      tipPercent: 15,
      total: 0
    };
  },
  totalBill() {
         return Math.round((this.state.total * (this.state.tipPercent / 100)) + this.state.total);
  },
  setPresetTip(event){
    switch(event.nativeEvent.selectedSegmentIndex){
      case 0:
        this.setState({tipPercent: 15});
        break;
      case 1:
        this.setState({tipPercent: 18});
        break;
      case 2:
        this.setState({tipPercent: 20});
        break;
    }
  },
  render: function() {
    return (
      <ScrollView style={styles.container}>
      <Text style={styles.welcome}>
        Calculate your tip
      </Text>
      <TextInput keyboardType="number-pad" clearTextOnFocus={true}
        style={{height: 40, borderColor: 'gray', borderWidth: 1}}
        onChangeText={(total) => this.setState({total: parseInt(total)})}
        value={parseInt(this.state.total)}
      />
      <Text style={styles.tip}>
        Tip: {Math.round(this.state.tipPercent)}%
      </Text>
      <Text style={styles.tip}>
        Total: {this.totalBill()}
      </Text>
        <SliderIOS maximumValue={30}
          style={styles.slider}
          value={this.state.tipPercent}
          onValueChange={(value) => this.setState({tipPercent: value})} />
        <SegmentedControlIOS values={['15%', '18%', '20%']}  onChange={this.setPresetTip}/>
      </ScrollView>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    padding: 30
  },
  slider: {
    height: 10,
    margin: 30,
  },
  welcome: {
    fontSize: 30,
    textAlign: 'center',
    marginBottom: 80,
  },
  tip: {
    textAlign: 'center',
    fontSize: 30,
    margin: 10
  }
});

AppRegistry.registerComponent('react_native_calc', () => react_native_calc);
