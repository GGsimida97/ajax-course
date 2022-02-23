package test;

public class Test {
    private float f = 1.0f;
    private static String email;

    public Test() {

    }


    public static void main (String[] args) {
        String classFile = "com.jd.". replaceAll(".", "/") + "MyClass.class";
        System.out.println(classFile);
    Test.email="dd";
    Test test = new Test();
        System.out.println(test.f = 1);

    }
}
