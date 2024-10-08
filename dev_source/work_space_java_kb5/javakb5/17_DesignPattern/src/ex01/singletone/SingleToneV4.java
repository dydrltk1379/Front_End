package ex01.singletone;

/** 최종적인 싱글톤
 * 2중 Locking 기법을 통해 임계 영역에 대한 원자성도 해결하고 속도도 해결함.
 *
 */
public class SingleToneV4 {
	private static SingleToneV4 instance;
	private SingleToneV4() {
		value++;
	}
	public static int value = 0;

	public static SingleToneV4 getInstance() {
		if(instance == null) { // 스레드가 많이 들어와도 1차적으로 막음
			synchronized(SingleToneV4.class) { // 2중 lock 기법, 2차적으로 막음
				if(instance == null) {
					instance = new SingleToneV4();
				}
			}
		}
		return instance;
	}
}