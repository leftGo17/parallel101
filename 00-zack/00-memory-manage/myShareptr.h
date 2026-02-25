#pragma once

struct ControlBlock {
    int ref_count;
    ControlBlock() : ref_count(1) {};
};

template <typename T>
class SimpleSharePtr {
  private:
    T* ptr;
    ControlBlock* control;
    void release() {
        if (control) {
            --control->ref_count;
            if (control->ref_count == 0) {
                delete ptr;
                ptr = nullptr;
                delete control;
                control = nullptr;
            }
        }
    }

  public:
    explicit SimpleSharePtr(T* ptr) : ptr(ptr) {
        if (ptr)
            control = new ControlBlock();
        else
            control = nullptr;
    }

    ~SimpleSharePtr() { release(); }

    // 如果用户传入SimpleSharePtr<int> p(nullptr)这种情况没有被考虑

    SimpleSharePtr(const SimpleSharePtr& other)
        : ptr(other.ptr), control(other.control) {
        if (control) ++control->ref_count;
    }

    SimpleSharePtr(SimpleSharePtr&& other) noexcept
        : ptr(other.ptr), control(other.control) {
        other.ptr = nullptr;
        other.control = nullptr;
    }

    SimpleSharePtr& operator=(const SimpleSharePtr& other) {
        if (this != &other) {
            release();
            ptr = other.ptr;
            control = other.control;
            if (control) ++control->ref_count;
            return *this;
        }
        return *this;
    }

    SimpleSharePtr& operator=(SimpleSharePtr&& other) noexcept {
        if (this != &other) {
            release();
            ptr = other.ptr;
            control = other.control;
            other.ptr = nullptr;
            other.control = nullptr;
            return *this;
        }
        return *this;
    }

    T& operator*() const { return *ptr; }
    T* operator->() const { return ptr; }
    int use_count() const { return control ? control->ref_count : 0; }
};