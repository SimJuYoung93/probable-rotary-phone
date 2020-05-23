package kr.or.ddit.enums;

public enum OperatorType {
	plus('+', (left, right) -> {return left + right;}),
	minus('-', (left, right) -> {return left - right;}),
	multiply('*', new Operator() {
		@Override
		public double operate(double left, double right) {
			return left * right;
		}
	}), divide('/', new Operator() {
		@Override
		public double operate(double left, double right) {
			return left / right;
		}
	});

	public interface Operator {
		public double operate(double left,double right);
	}
	
	private char sign;
	private Operator realOperator;

	private OperatorType(char sign, Operator realOperator) {
		this.sign = sign;
		this.realOperator = realOperator;
	}

	public double operate(double left, double right) {
		return realOperator.operate(left, right);
	}

	public char getSign() {
		return sign;
	}
}
