/// <reference path="../../tsd.d.ts" />

import {
  Component, View, Directive,
  OnInit, EventEmitter,
  ElementRef,
  DefaultValueAccessor,
  CORE_DIRECTIVES, NgClass,
  Self, NgModel, Renderer,
  ViewEncapsulation, ViewRef,
  ViewContainerRef, TemplateRef, NgFor, ComponentRef
} from 'angular2/angular2';

// todo: extract base functionality classes
// todo: use lodash#default for configuration
// todo: expose an option to change default configuration
// todo: solve problem with .pagination-sm>li:first-child>a and <template/> from ngIf >.<

const paginationConfig = {
  maxSize: undefined,
  itemsPerPage: 10,
  boundaryLinks: false,
  directionLinks: true,
  firstText: 'First',
  previousText: 'Previous',
  nextText: 'Next',
  lastText: 'Last',
  rotate: true
};

@Component({
  selector: 'pagination[ngModel], [pagination][ngModel]',
  properties: [
    'rotate', 'disabled',
    'totalItems', 'itemsPerPage', 'maxSize',
    'boundaryLinks', 'directionLinks',
    'firstText', 'previousText', 'nextText', 'lastText'
  ],
  events: ['numPages', 'pageChanged']
})
@View({
  template: `
  <ul class="pagination" [ngClass]="classMap">
    <li class="pagination-first"
        [ngClass]="{disabled: noPrevious()||disabled, hidden: !boundaryLinks}"
        [hidden]="!boundaryLinks">
      <a href (click)="selectPage(1, $event)">{{getText('first')}}</a>
    </li>

    <li class="pagination-prev"
        [ngClass]="{disabled: noPrevious()||disabled, hidden: !directionLinks}"
        [hidden]="!directionLinks">
      <a href (click)="selectPage(page - 1, $event)">{{getText('previous')}}</a>
      </li>

    <li *ngFor="#pg of pages"
    [ngClass]="{active: pg.active, disabled: disabled&&!pg.active}"
    class="pagination-page">
      <a href (click)="selectPage(pg.number, $event)">{{pg.text}}</a>
    </li>

    <li class="pagination-next"
        [ngClass]="{disabled: noNext()||disabled, hidden: !directionLinks}"
        [hidden]="!directionLinks">
      <a href (click)="selectPage(page + 1, $event)">{{getText('next')}}</a></li>

    <li class="pagination-last"
        [ngClass]="{disabled: noNext()||disabled, hidden: !boundaryLinks}"
        [hidden]="!boundaryLinks">
      <a href (click)="selectPage(totalPages, $event)">{{getText('last')}}</a></li>
  </ul>
  `,
  directives: [CORE_DIRECTIVES, NgClass],
  encapsulation: ViewEncapsulation.None
})
export class Pagination extends DefaultValueAccessor implements OnInit {
  public config:any;

  private classMap:string;
  private maxSize:number;
  private rotate:boolean;
  private boundaryLinks:any;

  // labels
  private firstText:string;
  private previousText:string;
  private nextText:string;
  private lastText:string;

  private disabled:boolean;
  private directionLinks:boolean;
  private numPages:EventEmitter = new EventEmitter();
  private pageChanged:EventEmitter = new EventEmitter();

  private _itemsPerPage:number;
  private _totalItems:number;
  private _totalPages:number;

  private inited: boolean = false;

  private get itemsPerPage() {
    return this._itemsPerPage;
  }

  private set itemsPerPage(v:number) {
    this._itemsPerPage = v;
    this.totalPages = this.calculateTotalPages();
  }

  private get totalItems():number {
    return this._totalItems;
  }

  private set totalItems(v:number) {
    this._totalItems = v;
    this.totalPages = this.calculateTotalPages();
  }

  private get totalPages() {
    return this._totalPages;
  }

  private set totalPages(v:number) {
    this._totalPages = v;
    this.numPages.next(v);
    if (this.inited) {
      this.selectPage(v);
    }
  }

  public set page(value) {
    this._page = (value > this.totalPages) ? this.totalPages : (value || 1);

    this.pageChanged.next({
      page: this._page,
      itemsPerPage: this.itemsPerPage
    });
  }

  public get page() {
    return this._page;
  }

  // ??
  private _page:number;
  private pages:Array<any>;

  constructor(@Self() cd:NgModel, renderer:Renderer, elementRef:ElementRef) {
    super(cd, renderer, elementRef);
    this.config = this.config || paginationConfig;
  }

  ngOnInit() {
    this.classMap = this.elementRef.nativeElement.getAttribute('class') || '';
    // watch for maxSize
    this.maxSize = typeof this.maxSize !== 'undefined' ? this.maxSize : paginationConfig.maxSize;
    this.rotate = typeof this.rotate !== 'undefined' ? this.rotate : paginationConfig.rotate;
    this.boundaryLinks = typeof this.boundaryLinks !== 'undefined' ? this.boundaryLinks : paginationConfig.boundaryLinks;
    this.directionLinks = typeof this.directionLinks !== 'undefined' ? this.directionLinks : paginationConfig.directionLinks;

    // base class
    this.itemsPerPage = typeof this.itemsPerPage !== 'undefined' ? this.itemsPerPage : paginationConfig.itemsPerPage;
    this.totalPages = this.calculateTotalPages();
    // this class
    this.pages = this.getPages(this.page, this.totalPages);
    this.page = this.cd.value;
    this.inited = true;
  }

  writeValue(value:number) {
    this.page = value;
    this.pages = this.getPages(this.page, this.totalPages);
  }

  private selectPage(page:number, event?:MouseEvent) {
    if (event) {
      event.preventDefault();
    }

    if (!this.disabled) {
      if (event && event.target) {
        event.target.blur();
      }
      this.writeValue(page);
      this.cd.viewToModelUpdate(this.page);
    }
  }

  private getText(key:string) {
    return this[key + 'Text'] || paginationConfig[key + 'Text'];
  }

  private noPrevious() {
    return this.page === 1;
  }

  private noNext() {
    return this.page === this.totalPages;
  }

  // Create page object used in template
  private makePage(number, text, isActive) {
    return {
      number: number,
      text: text,
      active: isActive
    };
  }

  private getPages(currentPage, totalPages) {
    let pages = [];

    // Default page limits
    let startPage = 1;
    let endPage = totalPages;
    let isMaxSized = typeof this.maxSize !== 'undefined' && this.maxSize < totalPages;

    // recompute if maxSize
    if (isMaxSized) {
      if (this.rotate) {
        // Current page is displayed in the middle of the visible ones
        startPage = Math.max(currentPage - Math.floor(this.maxSize / 2), 1);
        endPage = startPage + this.maxSize - 1;

        // Adjust if limit is exceeded
        if (endPage > totalPages) {
          endPage = totalPages;
          startPage = endPage - this.maxSize + 1;
        }
      } else {
        // Visible pages are paginated with maxSize
        startPage = ((Math.ceil(currentPage / this.maxSize) - 1) * this.maxSize) + 1;

        // Adjust last page if limit is exceeded
        endPage = Math.min(startPage + this.maxSize - 1, totalPages);
      }
    }

    // Add page number links
    for (var number = startPage; number <= endPage; number++) {
      let page = this.makePage(number, number, number === currentPage);
      pages.push(page);
    }

    // Add links to move between page sets
    if (isMaxSized && !this.rotate) {
      if (startPage > 1) {
        let previousPageSet = this.makePage(startPage - 1, '...', false);
        pages.unshift(previousPageSet);
      }

      if (endPage < totalPages) {
        let nextPageSet = this.makePage(endPage + 1, '...', false);
        pages.push(nextPageSet);
      }
    }

    return pages;
  }

  // base class
  private calculateTotalPages() {
    let totalPages = this.itemsPerPage < 1 ? 1 : Math.ceil(this.totalItems / this.itemsPerPage);
    return Math.max(totalPages || 0, 1);
  }
}


const pagerConfig = {
  itemsPerPage: 10,
  previousText: '« Previous',
  nextText: 'Next »',
  align: true
};

@Component({
  selector: 'pager[ngModel], [pager][ngModel]',
  properties: [
    'align',
    'totalItems', 'itemsPerPage',
    'previousText', 'nextText',
  ]
})
@View({
  template: `
    <ul class="pager">
      <li [ngClass]="{disabled: noPrevious(), previous: align, 'pull-left': align}"><a href (click)="selectPage(page - 1, $event)">{{getText('previous')}}</a></li>
      <li [ngClass]="{disabled: noNext(), next: align, 'pull-right': align}"><a href (click)="selectPage(page + 1, $event)">{{getText('next')}}</a></li>
  </ul>
  `,
  directives: [NgClass]
})
export class Pager extends Pagination implements OnInit {
  private align: boolean = pagerConfig.align;
  public config = pagerConfig;
  constructor(@Self() cd:NgModel, renderer:Renderer, elementRef:ElementRef) {
    super(cd, renderer, elementRef);
  }
}

export const pagination:Array<any> = [Pagination, Pager];
